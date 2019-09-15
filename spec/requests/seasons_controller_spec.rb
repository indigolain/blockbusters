require 'rails_helper'

RSpec.describe SeasonsController, type: :request do
  let(:request_header) {
    { 'CONTENT_TYPE': 'application/json', 'Accept': 'application/json' }
  }

  describe 'GET #index' do
    subject(:get_request) {
      get seasons_path, headers: request_header
    }

    let(:old_episode) {
      create(:episode, created_at: 1.day.ago)
    }
    let(:new_episode) {
      create(:episode, created_at: Time.current)
    }

    let(:old_season) {
      create(:season,
             created_at: 1.day.ago,
             episodes: [old_episode, new_episode])
    }
    let(:new_season) {
      create(:season,
             created_at: Time.current)
    }

    before do
      new_season
      old_season
      get_request
    end

    it 'returns list of seasons ordered by creation' do
      expect(parse_json(response.body, 'data/0/id')).to eq(old_season.id.to_s)
      expect(parse_json(response.body, 'data/1/id')).to eq(new_season.id.to_s)
    end

    it 'returns list of associated episodes ordered by creation' do
      expect(parse_json(response.body, 'data/0/relationships/episodes/data/0/id')).to eq(old_episode.id.to_s)
      expect(parse_json(response.body, 'data/0/relationships/episodes/data/1/id')).to eq(new_episode.id.to_s)
    end

    it { is_expected.to eq 200 }
  end
end
