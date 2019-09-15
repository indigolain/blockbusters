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

    context 'when the user has not yet purchased the content' do
      it 'creates a record of purchase' do
        expect { post_request }.to change(Purchase, :count)
      end
    end

    context 'when the user has already purchased the content and is active' do
      let(:purchase) {
        create(:purchase,
               user: user,
               purchase_option: purchase_option)
      }

      before do
        purchase
      end

      it 'will not creates a record of purchase' do
        expect { post_request }.not_to change(Purchase, :count)
      end
    end

    context 'when the user has already purchased the content, but is expired' do
      let(:purchase) {
        create(:purchase,
               user: user,
               purchase_option: purchase_option,
               created_at: 2.days.ago)
      }

      before do
        purchase
      end

      it 'will create a record of purchase' do
        expect { post_request }.to change(Purchase, :count)
      end
    end
  end
end
