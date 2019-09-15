require 'rails_helper'

RSpec.describe VisualContentsController, type: :request do
  let(:request_header) {
    { 'CONTENT_TYPE': 'application/json', 'Accept': 'application/json' }
  }

  describe 'GET #index' do
    subject(:get_request) { get visual_contents_path, headers: request_header }

    let(:old_visual_content) { create(:visual_content, created_at: 1.day.ago) }
    let(:new_visual_content) { create(:visual_content, created_at: Time.current) }

    it { is_expected.to eq 200 }

    before do
      new_visual_content
      old_visual_content
      get_request
    end

    it { is_expected.to eq 200 }
    it 'returns list of visual_contents ordered by creation' do
      expect(parse_json(response.body, 'data/0/id')).to eq(old_visual_content.id.to_s)
      expect(parse_json(response.body, 'data/1/id')).to eq(new_visual_content.id.to_s)
    end
  end
end
