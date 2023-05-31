class Recipe
  attr_reader :name, :description
  attr_accessor :done, :rating, :prep_time

  def initialize(name, description, rating = 0.0, done = false, prep_time = 0)
    @name = name
    @description = description
    @rating = rating
    @done = done
    @prep_time = prep_time
  end

  def mark_as_done!
    @done = true
  end
end
