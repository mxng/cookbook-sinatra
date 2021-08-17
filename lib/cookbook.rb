require 'csv'
require_relative 'recipe'

class Cookbook
  attr_reader :recipes

  def initialize(csv_file_path)
    @recipes = []
    @filepath = csv_file_path
    parse_csv
  end

  def all
    return @recipes
  end

  def add_recipe(recipe)
    @recipes.push(recipe)
    store_csv
    puts "Recipe added"
  end

  def toggle_recipe(recipe_index)
    @recipes[recipe_index].status = (@recipes[recipe_index].status ? false : true)
    store_csv
    puts "Recipe status changed"
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    store_csv
    puts "Recipe deleted"
  end

  private

  def parse_csv
    CSV.foreach(@filepath) do |row|
      row.empty? ? break : @recipes.push(Recipe.new(row[0], row[1], row[2], row[3]))
    end
    puts @recipes.empty? ? "No recipes right now" : "There are #{@recipes.length} recipes ready"
  end

  def store_csv
    CSV.open(@filepath, 'wb') do |csv|
      @recipes.each { |item| csv << [item.name, item.description, item.rating, item.status] }
    end
  end
end
