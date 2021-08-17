class Recipe
  attr_reader :name, :description, :rating
  attr_accessor :status

  def initialize(name, description, rating, status = false)
    @name = name
    @description = description
    @rating = rating
    @status = status
  end
end
