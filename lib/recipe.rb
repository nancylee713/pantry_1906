class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amt)
    @ingredients_required[ingredient] = amt
  end

  def amount_required(ingredient)
    @ingredients_required[ingredient]
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    ingredients.sum {|ingredient| ingredient.calories * amount_required(ingredient)}
  end
end
