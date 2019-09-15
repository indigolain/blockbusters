class PurchasedContentsController < ApplicationController
  def index
    render json: VisualContentSerializer.new(
                   user.purchased_contents.merge(Purchase.active)
                 )
  end

  private

    def user
      @user = User.find(params[:user_id])
    end
end
