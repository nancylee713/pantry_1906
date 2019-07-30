class CookBook

  attr_reader :recipes

  def initialize(recipes = [])
    @recipes = recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def summary
    sum = Hash.new

    @recipes.each do |recipe|
      sum[:name] = recipe.name
      sum[:details] = ingredient_total_cal_info
    end
    sum
  end

  def ingredient_total_cal_info
    mid_sum = Hash.new

    @recipes.each do |recipe|
      mid_sum[:ingredients] = ingredient_info
      mid_sum[:total_calories] = total_calories
    end
  end

  def ingredient_info
    ingredients = []

    @recipes.each do |recipe|
      recipe.ingredients_required.each do |ing, amt|
        ing_info = Hash.new
        ing_info[:ingredient] = ing.name
        ing_info[:amount] = amt.to_s + " " + ing.unit
        ingredients << ing_info
      end
    end
    ingredients
  end
end
