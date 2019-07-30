require 'minitest/autorun'
require 'minitest/pride'
require './lib/pantry'
require './lib/recipe'
require './lib/ingredient'

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new
    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_attributes
    assert_equal ({}), @pantry.stock
  end

  def test_stock_is_initially_empty
    assert_equal 0, @pantry.stock_check(@cheese)
  end

  def test_restock
    @pantry.restock(@cheese, 5)
    assert_equal 5, @pantry.stock_check(@cheese)

    @pantry.restock(@cheese, 10)
    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_check_ingredients_enough
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)

    refute @pantry.enough_ingredients_for?(@mac_and_cheese)

    @pantry.restock(@mac, 7)
    refute @pantry.enough_ingredients_for?(@mac_and_cheese)

    @pantry.restock(@mac, 1)
    assert @pantry.enough_ingredients_for?(@mac_and_cheese)
  end
end
