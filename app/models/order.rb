class Order < ActiveRecord::Base
  has_many :products, class_name: 'OrderProduct'
  validates :email, presence: true, format: /@/
  validates :phone, presence: true, format: /\d/

  accepts_nested_attributes_for :products

  before_save :cal_total

  private

  def cal_total
    products.each do |product|
      self.total += Product.find(product.product_id).price * product.quantity
    end
  end
end
