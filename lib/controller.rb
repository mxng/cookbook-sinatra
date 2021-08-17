require_relative 'recipe'
require_relative 'view'
require_relative 'scrape'

class Controller
  attr_reader :top_five

  def initialize(cookbook)
    @cookbook = cookbook # Dependency injection from an instance of Cookbook class
    @view = View.new # Dependency injection from an instance of View class
  end

  def list
    @view.display(@cookbook.all)
  end

  def create
    name, desc, rating = @view.ask_for_new_recipe
    @cookbook.add_recipe(Recipe.new(name, desc, rating)) if !name.nil? && !desc.nil?
    return nil
  end

  def toggle
    list
    recipe_index = @view.ask_for_index
    @cookbook.toggle_recipe(recipe_index)
  end

  def destroy
    recipe_index = @view.ask_for_index
    @cookbook.remove_recipe(recipe_index) unless recipe_index.nil?
    return nil
  end

  def search
    kw = @view.ask_for_search_keyword
    scraper = ScrapeAllrecipesService.new(kw)
    top_five = scraper.call
    @view.display_search(top_five)
    add_import(top_five)
  end

  def add_import(arr)
    ind = @view.ask_for_index
    @cookbook.add_recipe(arr[ind]) unless ind.nil? || arr[ind].nil?
  end
end
