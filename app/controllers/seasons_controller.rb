class SeasonsController < ApplicationController
  def index
    serialize_options = { include: %i[episodes] }
    render json: SeasonSerializer.new(seasons, serialize_options)
  end

  private

    def seasons
      Rails.cache.fetch('seasons_index', expires_in: 1.minute) do
        Season.order(:created_at).to_a
      end
    end
end
