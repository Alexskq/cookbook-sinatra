require "csv"
require_relative 'recipe'


class Cookbook
  attr_reader :csv_file_path

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    read_csv
  end

  def all
    @recipes
  end

  def create(recipe)
    @recipes << recipe
    save_csv
  end

  def destroy(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end

  def find(index)
    @recipes[index]
  end

  private

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rate, recipe.done, recipe.prep_time]
      end
    end
  end

  def read_csv
    CSV.foreach(@csv_file_path) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2], row[3], row[4])
    end
  end

end




###### PARSE CSV ###################


# require "csv"



# CSV.foreach(filepath) do |row|
#   # Here, row is an array of columns
#   puts "#{row[0]} | #{row[1]} | #{row[2]}"
# end
