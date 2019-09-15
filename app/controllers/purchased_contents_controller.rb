class PurchasedContentsController < ApplicationController
  def index
    render json: VisualContentSerializer.new(
                   user.purchased_contents.where(purchases: {
                                                   created_at: 2.days.ago..Float::INFINITY
                                                 })
                 )
  end

  private

    def user
      @user = User.find(params[:user_id])
    end
end
