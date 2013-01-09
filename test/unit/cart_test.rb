require 'test_helper'

class CartTest < ActiveSupport::TestCase
  def setup
    @cart = Cart.create()
    @book_one = products(:one)
    @book_two = products(:two)
  end

  test "add unique products" do
    @cart.add_product(@book_one.id).save!
    @cart.add_product(@book_two.id).save!
    assert_equal 2, @cart.line_items.size
    assert_equal @cart.total_price, @book_one.price + @book_two.price
  end

  test "add duplicate products" do
    @cart.add_product(@book_one.id).save!
    @cart.add_product(@book_one.id).save!
    assert_equal 1, @cart.line_items.size
    assert_equal @cart.total_price, @book_one.price * 2
    assert_equal 2, @cart.line_items[0].quantity
  end

end
