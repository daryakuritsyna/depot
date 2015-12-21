class Order < ActiveRecord::Base
  has_many :products, class_name: 'OrderProduct'
  validates :email, presence: true, format: /@/
  validates :phone, presence: true, format: /\d/

  accepts_nested_attributes_for :products

  before_save :cal_total

  private

  def cal_total
    # TODO; Sum order_products*quantity
  end
end
