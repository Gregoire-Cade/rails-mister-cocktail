require 'json'
require 'open-uri'

puts "Clearing ingredients database"
Ingredient.destroy_all
puts "Creating ingredients"
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
data = open(url).read
data_hash = JSON.parse(data)
ingredients = data_hash["drinks"]
  ingredients.each do |ingredient|
    Ingredient.create(name: ingredient["strIngredient1"])
  end
