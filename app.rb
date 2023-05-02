require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

get "/" do
  cookbook = Cookbook.new('recipes.csv')
  @recipes = cookbook.all
  "Hello world"
  erb :index
end

get "/about" do
  erb :about
end

get "/recipe/:id" do

  erb :about
end
