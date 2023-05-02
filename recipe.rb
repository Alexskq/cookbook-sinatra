require_relative "view"
require_relative "controller"

class Recipe
  attr_reader :name, :description, :rate, :done, :prep_time

  def initialize(name, description, rate, done = false, prep_time)
    @name = name
    @description = description
    @rate = rate
    @done = done
    @prep_time = prep_time
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = true
  end

  def unmark
    @done = false
  end
end
