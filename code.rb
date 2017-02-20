class Ingredient
  attr_reader :summary
  def initialize(quantity, unit, name)
    @quantity, @unit, @name = quantity, unit, name
  end
  def summary
    @summary = "#{@quantity} #{@unit} #{@name}"
  end
end
ingredient = Ingredient.new(47.0, "lb(s)", "Brussels Sprouts")
puts ingredient.summary

class Recipe
  attr_reader :summary
  def initialize(name, instructions = [], ingredients = [])
    @name, @instructions, @ingredients = name, instructions, ingredients
  end

  def summary
    puts "\nRecipe: #{@name}\n"
    puts "\nIngredients:"
    @ingredients.each do |item|
      puts "- #{item.summary}"
    end
    puts "\nInstructions:"
    @instructions.each_with_index do |step, num|
      puts "#{num + 1}. #{step}"
    end
    return
  end
end

ingredients_a = [
    Ingredient.new(1.0, "cup", "half & half"),
    Ingredient.new(3.0, "", "large eggs"),
    Ingredient.new(2.0, "tbsp", "honey (warmed in microwave for 20 seconds)"),
    Ingredient.new(0.25, "tsp", "salt"),
    Ingredient.new(8.0, "1/2-inch slices", "bread"),
    Ingredient.new(4.0,  "tbsp", "butter")
  ]

instructions_a = "In medium size mixing bowl, whisk together the half-and-half, eggs, honey, and salt. You may do this the night before.
When ready to cook, pour custard mixture into a pie pan and set aside.
Preheat oven to 375 degrees F.
Dip bread into mixture, allow to soak for 30 seconds on each side, and then remove to a cooling rack that is sitting in a sheet pan, and allow to sit for 1 to 2 minutes.
Over medium-low heat, melt 1 tablespoon of butter in a 10-inch nonstick saute pan.
Place 2 slices of bread at a time into the pan and cook until golden brown, approximately 2 to 3 minutes per side.
Remove from pan and place on rack in oven for 5 minutes.
Repeat with all 8 slices.
Serve immediately with maple syrup, whipped cream or fruit.".split("\n")

a = Recipe.new("French Toast", instructions_a, ingredients_a)
# *******http://www.foodnetwork.com/recipes/alton-brown/french-toast-recipe*******
puts a.summary

ingredients = [
  Ingredient.new(0.67, "cups", "undiluted Carnation Evaporated Milk"),
  Ingredient.new(1.67, "cups", "sugar"),
  Ingredient.new(0.5, "tsp", "salt"),
  Ingredient.new(2.0, "tbsp", "butter"),
  Ingredient.new(2.0, "cups", "miniature marshmallows or diced marshmallows"),
  Ingredient.new(0.5, "cups", "chopped nuts"),
  Ingredient.new(1.5, "cups", "semi-sweet chocolate chips"),
  Ingredient.new(1.0, "tsp", "vanilla")
]
instructions = [ "Put Carnation, sugar, salt, and butter in saucepan and put on stove.",
  "Turn burner to medium. Heat to boiling; stir often.",
  "Cook 5 minutes, stirring all the time so the milk and sugar do not scorch.",
  "Remove saucepan from heat. Add marshmallows, chopped nuts, chocolate, and vanilla.",
  "Stir fudge with a wooden spoon until marshmallows and chocolate are melted.",
  "Pour fudge into a buttered 8 inch square pan.",
  "When the fudge is cool, cut into squares."
]
b = Recipe.new("Five Minute Fudge", instructions, ingredients)
puts b.summary
