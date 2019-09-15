require 'rails_helper'

RSpec.describe MoviesController, type: :request do
  let(:request_header) {
    { 'CONTENT_TYPE': 'application/json', 'Accept': 'application/json' }
  }
  describe 'GET #index' do
    subject(:get_request) { get movies_path, headers: request_header }

    it { is_expected.to eq 200 }
  end
end
