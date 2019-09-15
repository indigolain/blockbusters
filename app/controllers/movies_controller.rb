class MoviesController < ApplicationController
  def index
    render json: MovieSerializer.new(Movie.order(:created_at))
  end
end
