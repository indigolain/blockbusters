class SeasonsController < ApplicationController
  def index
    serialize_options = { include: %i[episodes] }
    render json: SeasonSerializer.new(Season.order(:created_at), serialize_options)
  end
end
