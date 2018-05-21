require 'rails_helper'

RSpec.shared_context 'Authenticated User' do
  include AuthenticationHelper

  let(:user) { create(:user) }

  before { login(user) }
end

RSpec.configure do |rspec|
  rspec.include_context 'Authenticated User', include_shared: true
end
