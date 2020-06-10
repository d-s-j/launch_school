# app.rb

require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"
require "yaml"

before do
  @data = YAML.load_file("users.yaml")
  @users = @data.keys
end

helpers do
  def count_interests
    count = 0
    @users.each do |name|
      count += @data[name][:interests].size
    end
    count
  end
end

get "/" do
  redirect "/users"
end

get "/users" do
  erb :users
end

get "/users/:name" do
  erb :user
end