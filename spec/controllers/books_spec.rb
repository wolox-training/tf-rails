require 'rails_helper'
require 'helpers/shared_contexts/authenticated_user_spec'

describe BooksController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'When fetching all the books' do
      let!(:books) { create_list(:book, 3) }

      before do
        get :index
      end

      it 'checks that the response keys matches with the default formatter' do
        expect(JSON.parse(response.body)).to be_paginated
      end

      it 'responses with the users books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BookSerializer
        ).to_json
        expect(JSON.parse(response.body)) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'When fetching a book' do
      let!(:book) { create(:book) }

      before do
        get :show, params: { id: book.id }
      end

      it 'responses with the user book json' do
        expect(response.body).to eq BookSerializer.new(
          book
        ).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
