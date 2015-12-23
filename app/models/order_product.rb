class OrderProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  delegate :price, :name, to: :product
end
