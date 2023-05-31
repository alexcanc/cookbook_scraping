class View
  def display_list(recipes)
    puts "Cookbook Recipes:"
    recipes.each_with_index do |recipe, index|
      status = recipe.done ? '[X]' : '[ ]'
      puts "#{index + 1}. #{status} #{recipe.name} (#{recipe.rating}/5) - #{recipe.prep_time} min (#{recipe.description})"
    end
  end

  def ask_recipe_name
    puts "Enter the recipe name:"
    gets.chomp
  end

  def ask_recipe_description
    puts "Enter the recipe description:"
    gets.chomp
  end

  def ask_recipe_index_to_remove
    puts "Enter the index of the recipe to remove:"
    gets.chomp.to_i - 1
  end

  def ask_recipe_rating
    puts "Enter the recipe rating (0-5):"
    rating = gets.chomp.to_f
    rating
  end

  def ask_recipe_prep_time
    puts "Enter the recipe prep time:"
    gets.chomp
  end

  def recipe_created
    puts "Recipe created!"
  end

  def ask_recipe_index_to_mark_as_done
    puts "Enter the index of the recipe to mark as done:"
    gets.chomp.to_i - 1
  end

  def recipe_marked_as_done(recipe)
    puts "Recipe '#{recipe.name}' marked as done!"
  end

  def recipe_removed
    puts "Recipe removed!"
  end

  def ask_keyword_to_search
    puts "Enter a keyword to search:"
    gets.chomp
  end

  def ask_recipe_index_to_import
    puts "Enter the index of the recipe to import:"
    gets.chomp.to_i - 1
  end

  def recipe_imported
    puts "Recipe imported!"
  end
end
