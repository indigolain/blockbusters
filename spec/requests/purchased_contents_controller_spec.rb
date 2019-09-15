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
    let(:visual_content) {
      create(:movie, purchase_options: [purchase_option])
    }
    let(:purchase_option) {
      build(:purchase_option)
    }

    before do
      visual_content
      purchase
    end

    context "when user's purchased content is alive" do
      let(:purchase) {
        create(:purchase,
               user: user,
               purchase_option: purchase_option)
      }

      before do
        get_request
      end

      it { is_expected.to eq 200 }
      it 'returns list of purchased contents' do
        expect(response.body).to have_json_size(1).at_path('data')
      end
    end

    context "when user's purchased content is expired" do
      let(:purchase) {
        create(:purchase,
               user: user,
               purchase_option: purchase_option,
               created_at: 2.days.ago)
      }

      before do
        get_request
      end

      it { is_expected.to eq 200 }
      it 'returns empty array' do
        expect(response.body).to have_json_size(0).at_path('data')
      end
    end
  end
end
