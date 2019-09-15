require 'rails_helper'

RSpec.describe PurchasesController, type: :request do
  describe 'POST #create' do
    subject(:post_request) {
      post user_purchases_path(user_id: user.id),
           params: params
    }

    let(:user) { create(:user) }
    let(:purchase_option) { create(:purchase_option) }
    let(:params) {
      { purchase_option_id: purchase_option.id }
    }

    it { is_expected.to eq 200 }
  end
end
