class Admin::OrdersController < ApplicationController
  layout "admin"
  # before_action :logged_in_user
  before_action :find_by_id, only: %i(show)

  def index
    @pagy, @orders = pagy Order.latest.includes(:user),
                          items: Settings.order.max_page
  end

  def show
    @order_details = @order.order_details
  end

  private

  def find_by_id
    @order = Order.find_by id: params[:id]
    return if @order

    flash[:danger] = t ".not_found_order"
    redirect_to admin_order_path
  end

  def order_params
    params.require(:order).permit Order::FIELD_PERMIT
  end
end
