class Ingredient
  VALID_INGREDIENTS = [
    "brussels_sprouts",
    "spinach",
    "eggs",
    "milk",
    "tofu",
    "seitan",
    "bell_peppers",
    "quinoa",
    "kale",
    "chocolate",
    "beer",
    "wine",
    "whiskey"
  ]
  attr_reader :summary
  def initialize(quantity, unit, name)
    @quantity, @unit, @name = quantity, unit, name
  end
  def summary
    @summary = "#{@quantity} #{@unit} #{@name}"
  end

  def self.parse(info)
    summary = info.split(" ")
    new(summary[0].to_f, summary[1], summary[2])
  end

  def safe_ingredient?
    VALID_INGREDIENTS.include?(@name)
  end
end

class Recipe
  attr_reader :summary
  def initialize(name, instructions = [], ingredients = [])
    @name, @instructions, @ingredients = name, instructions, ingredients
  end

  def summary
    @summary =
    puts "\nRecipe: #{@name}\n\nIngredients:"
      @ingredients.each do |item|
        puts "- #{item.summary}\n"
      end
    puts "\nInstructions:"
      @instructions.each_with_index do |step, num|
        "#{num + 1}. #{step}"
      end
  end
  def safe_recipe?
    @ingredients.all? { |item| item.safe_ingredient? }
  end
end

ingredients = [
  # Ingredient.new(0.67, "cups", "undiluted Carnation Evaporated Milk"),
  # Ingredient.new(1.67, "cups", "sugar"),
  # Ingredient.new(0.5, "tsp", "salt"),
  # Ingredient.new(2.0, "tbsp", "butter"),
  # Ingredient.new(2.0, "cups", "miniature marshmallows or diced marshmallows"),
  # Ingredient.new(0.5, "cups", "chopped nuts"),
  # Ingredient.new(1.5, "cups", "semi-sweet chocolate chips"),
  Ingredient.new(1.0, "tsp", "beer")
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
puts b.safe_recipe?
# c = Ingredient.parse("5 tspn(s) milk")
puts b.summary
c = Ingredient.parse("2 cups water")
puts c.summary
