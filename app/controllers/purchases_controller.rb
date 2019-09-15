class PurchasesController < ApplicationController
  def create
    purchase = user.purchases.create(purchase_params)
    render json: PurchaseSerializer.new(purchase)
  end

  private

    def user
      @user = User.find(params[:user_id])
    end

    def purchase_params
      permitted_params = %i[purchase_option_id]
      params.permit(permitted_params)
    end
end
