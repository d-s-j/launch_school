# app.rb

require "sinatra"
require "sinatra/reloader"

get "/" do
  @title = "Dynamic Directory Index"
  @files = Dir.glob("public/*").map { |file| File.basename(file) }.sort
  @files.reverse! if params[:sort] == "descending"

  erb :home
end