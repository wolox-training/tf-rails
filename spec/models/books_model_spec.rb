require 'rails_helper'

describe Book, type: :model do
  it do
    expect(:genre).to be_present
  end
  it do
    expect(:author).to be_present
  end
  it do
    expect(:image).to be_present
  end
  it do
    expect(:title).to be_present
  end
  it do
    expect(:publisher).to be_present
  end
  it do
    expect(:year).to be_present
  end

  subject(:book) { build(:book) }

  it do
    is_expected.to be_valid
  end

  describe '#create' do
    context 'When genre is nil' do
      subject(:book) { build(:book, genre: nil) }

      it do
        is_expected.not_to be_valid
      end
    end

    context 'When author is nil' do
      subject(:book) { build(:book, author: nil) }

      it do
        is_expected.not_to be_valid
      end
    end

    context 'When image is nil' do
      subject(:book) { build(:book, genre: nil) }

      it do
        is_expected.not_to be_valid
      end
    end

    context 'When title is nil' do
      subject(:book) { build(:book, genre: nil) }

      it do
        is_expected.not_to be_valid
      end
    end

    context 'When publisher is nil' do
      subject(:book) { build(:book, genre: nil) }

      it do
        is_expected.not_to be_valid
      end
    end

    context 'When year is nil' do
      subject(:book) { build(:book, genre: nil) }

      it do
        is_expected.not_to be_valid
      end
    end
  end
end
