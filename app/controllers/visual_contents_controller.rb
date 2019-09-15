class VisualContentsController < ApplicationController
  def index
    render json: VisualContentSerializer.new(VisualContent.order(:created_at))
  end
end
