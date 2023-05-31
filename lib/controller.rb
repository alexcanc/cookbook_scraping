require_relative 'view'
require_relative 'recipe'
require_relative 'scrape_marmiton_service'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    recipes = @cookbook.all
    @view.display_list(recipes)
  end

  def add
    name = @view.ask_recipe_name
    description = @view.ask_recipe_description
    rating = @view.ask_recipe_rating
    prep_time = @view.ask_recipe_prep_time
    recipe = Recipe.new(name, description, rating, false, prep_time)
    @cookbook.create(recipe)
    @view.recipe_created
  end

  def import
    keyword = @view.ask_keyword_to_search
    scraper = ScrapeMarmitonService.new(keyword)
    recipes = scraper.call
    @view.display_list(recipes)
    recipe_index = @view.ask_recipe_index_to_import
    recipe = recipes[recipe_index]
    @cookbook.create(recipe)
    @view.recipe_imported
  end

  def mark_recipe_as_done
    list
    recipe_index = @view.ask_recipe_index_to_mark_as_done
    recipe = @cookbook.all[recipe_index]
    recipe.mark_as_done!
    @cookbook.save_csv
    @view.recipe_marked_as_done(recipe)
  end

  def remove
    list
    recipe_index = @view.ask_recipe_index_to_remove
    @cookbook.destroy(recipe_index)
    @view.recipe_removed
  end
end
