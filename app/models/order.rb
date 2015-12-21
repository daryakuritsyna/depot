class Order < ActiveRecord::Base
  attr_accessor :products_attributes
  has_many :products, class_name: 'OrderProduct'
  validates :email, presence: true, format: /@/
  validates :phone, presence: true, format: /\d/

  accepts_nested_attributes_for :products

  before_save :cal_total

  private

  def cal_total
    products_attributes.each_value do |pair|
      self.total += Product.find(pair[:product_id]).price.to_f * pair[:quantity].to_i
    end
  end
end
