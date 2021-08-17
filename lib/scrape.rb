require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

class ScrapeAllrecipesService
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    arr = []
    html_doc = Nokogiri::HTML(URI.open("#{@keyword}.html").read)
    html_doc.search('.card__detailsContainer')[0, 5].each do |element|
      name = element.search('.card__title').text.strip
      description = element.search('.card__summary').text.strip
      rating = element.search('.review-star-text').text.strip.match(/[0-9.]/)[0].to_i
      arr.push(Recipe.new(name, description, rating))
    end
    return arr
  end
end
