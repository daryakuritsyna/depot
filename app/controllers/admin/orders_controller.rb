class Admin::OrdersController < Admin::AdminsController
  expose :order
  expose(:orders) { |default| default.order('created_at DESC').page(params[:page]).per(10) }

  def update
    order.update(order_params)
    flash[:success] = 'Order was successfully updated'
    redirect_via_turbolinks_to admin_order_path(order.id)
  end

  private

  def order_params
    params[:order].permit!
  end
end
