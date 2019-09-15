class VisualContentsController < ApplicationController
  def index
    render json: VisualContentSerializer.new(visual_contents)
  end

  private

    def visual_contents
      Rails.cache.fetch('visual_contents_index', expires_in: 1.minute) do
        VisualContent.order(:created_at).to_a
      end
    end
end
