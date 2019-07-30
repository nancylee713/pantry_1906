class CookBook

  attr_reader :recipes

  def initialize(recipes = [])
    @recipes = recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def summary
    result = []

    @recipes.each do |recipe|
      sum = Hash.new
      ingredients = []

      recipe.ingredients_required.each do |ing, amt|
        sum[:name] = recipe.name

        ing_info = Hash.new
        ing_info[:ingredient] = ing.name
        ing_info[:amount] = amt.to_s + " " + ing.unit
        ingredients << ing_info
      end

      mid_sum = Hash.new
      mid_sum[:ingredients] = ingredients
      mid_sum[:total_calories] = recipe.total_calories
      sum[:details] = mid_sum
      result << sum
    end
    result
  end

end
