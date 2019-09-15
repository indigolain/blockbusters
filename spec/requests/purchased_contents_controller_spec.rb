require 'rails_helper'

RSpec.describe PurchasedContentsController, type: :request do
  let(:request_header) {
    { 'CONTENT_TYPE': 'application/json', 'Accept': 'application/json' }
  }

  describe 'GET #index' do
    subject(:get_request) {
      get user_purchased_contents_path(user_id: user.id),
      headers: request_header
    }

    let(:user) { create(:user) }

    it { is_expected.to eq 200 }
  end
end
