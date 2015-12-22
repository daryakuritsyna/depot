class Admin::OrdersController < Admin::AdminsController
  expose :order
  expose(:orders) { |default| default.order('created_at DESC').page(params[:page]).per(10) }
end
