class MoviesController < ApplicationController
  def index
    render json: MovieSerializer.new(movies)
  end

  private

    def movies
      Rails.cache.fetch('movies_index', expires_in: 1.minute) do
        Movie.order(:created_at).to_a
      end
    end
end
