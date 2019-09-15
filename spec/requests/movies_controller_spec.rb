require 'rails_helper'

RSpec.describe MoviesController, type: :request do
  let(:request_header) {
    { 'CONTENT_TYPE': 'application/json', 'Accept': 'application/json' }
  }
  describe 'GET #index' do
    subject(:get_request) { get movies_path, headers: request_header }

    let(:old_movie) { create(:movie, created_at: 1.day.ago) }
    let(:new_movie) { create(:movie, created_at: Time.current) }

    before do
      new_movie
      old_movie
      get_request
    end

    it { is_expected.to eq 200 }
    it 'returns list of movies ordered by creation' do
      expect(parse_json(response.body, 'data/0/id')).to eq(old_movie.id.to_s)
      expect(parse_json(response.body, 'data/1/id')).to eq(new_movie.id.to_s)
    end
  end
end
