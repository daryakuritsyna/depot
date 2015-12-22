class Admin::OrdersController < Admin::AdminsController
  expose :order
  expose(:orders) { |default| default.page(params[:page]).per(10) }
end
