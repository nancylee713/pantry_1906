class Pantry
  attr_reader :stock

  def initialize(stock = Hash.new(0))
    @stock = stock
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amt)
    @stock[ingredient] += amt
  end

  def enough_ingredients_for?(recipe)
    result = recipe.ingredients_required.map do |ing, amt|
      if @stock.has_key? ing
        @stock[ing] >= amt
      else
        return false
      end
    end
    result.all? {|x| x == true}
  end
end
