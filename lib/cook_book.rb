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
      sum[:details] = mid_info
    end

    [sum]
  end

  def mid_info
    mid_sum = Hash.new
    ingredients = []

    @recipes.each do |recipe|
      recipe.ingredients_required.each do |ing, amt|
        ing_info = Hash.new
        ing_info[:ingredient] = ing.name
        ing_info[:amount] = amt.to_s + " " + ing.unit
        ingredients << ing_info
      end

      mid_sum[:ingredients] = ingredients
      mid_sum[:total_calories] = recipe.total_calories
    end
    mid_sum
  end

end
