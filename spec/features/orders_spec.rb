require 'rails_helper'

describe 'Orders' do
  let!(:product) { create(:product) }

  describe 'Add to cart' do
    it 'adds product to cart', js: true do
      visit '/'
      first('.product-link').click
      click_link 'Add to cart'
      expect(page).to have_content('Cart 1')
      click_link 'Cart'
      expect(page).to have_content("#{product.price}")
      fill_in "quantity_#{product.id}", with: '7'
      expect(page).to have_content("Order total: #{product.price * 7}")
    end
    it 'remove product from cart', js: true do
      visit '/'
      first('.product-link').click
      click_link 'Add to cart'
      click_link 'Cart'
      click_link "delete_#{product.id}"
      expect(page).not_to have_content('Cart 1')
    end
  end
end
