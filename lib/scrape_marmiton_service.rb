require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

class ScrapeMarmitonService
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    url = URI.parse("https://www.marmiton.org/recettes/recherche.aspx?aqt=#{@keyword}")
    html = URI.open(url).read
    doc = Nokogiri::HTML(html)
    recipes = []
    base_url = "https://www.marmiton.org"

    doc.search('.MRTN__sc-1gofnyi-2.gACiYG').first(12).each do |element|
      recipe_url = element.attribute('href').value
      name = element.search('h4.MRTN__sc-30rwkm-0.dJvfhM').text.strip
      description = element.search('.MRTN__sc-30rwkm-3.fyhZvB').text.strip.gsub(/[()]/, '')
      rating_element = element.search('.SHRD__sc-10plygc-0.jHwZwD').text.strip
      rating = rating_element.split('/').first.to_f

      recipe_html = URI.open("#{base_url}#{recipe_url}").read
      recipe_doc = Nokogiri::HTML.parse(recipe_html)
      prep_time_element = recipe_doc.search('.RCP__sc-1qnswg8-5.fFlxFh').text.strip
      hours = prep_time_element.scan(/\b\d\b/).first.to_i
      minutes = prep_time_element.scan(/\b\d{2}\b/).first.to_i

      prep_time = (hours * 60) + minutes

      recipes << Recipe.new(name, description, rating, false, prep_time)
    end

    return recipes
  end
end
