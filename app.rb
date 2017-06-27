# ======= requires =======
require "sinatra"
require 'sinatra/activerecord'
require "sinatra/reloader"
require "./models"

# ======= database =======

set :database, "sqlite3:kramer.sqlite3"  # sets the db name (will be created if it does not exist)

# @@user_data = []

# ======= home =======
get '/' do
	@name = "kramerica"
	erb :index
end

# ===== gallery ======
get '/gallery' do
	@pic1 = params[:pic1]
	@pic2 = params[:pic2]
	@pic3 = params[:pic3]
	@pic4 = params[:pic4]
	erb :gallery
end

# ===== about ======
get '/about' do
	erb :about
end

# ===== contact =====
get '/contact' do
	erb :contact
end

get '/users' do
    @users = User.all

    erb :users
end

post '/users' do

  @user = User.new(
    firstname: params[:firstname],
    lastname: params[:lastname],
    email: params[:email],
    username: params[:username],
    usertype: params[:usertype]
  )

  if @user.save
    puts 'saved new user!'
    puts @user
  end

  erb :user

end

get '/getUserOne' do
    @user = User.find(2)
    erb :user
end

get '/getUserOne/:id' do
    @user = User.find(params[:id])
    erb :user
end

#===placeorder====#
post '/placeorder' do
	puts "***** params.inspect: #{params.inspect}"
	@photoArray = []
	params.delete("captures")
	params.each_with_index do |item, index|
		puts "***** item: #{item}"
		puts "***** index: #{index}"
		@photoArray << item[1]
	end
	puts "**app*** @photoArray: #{@photoArray}"
	erb :placeorder
end

# def make_user_data
# 	puts "****** make_user_data"
# 	lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
# 	formatted = lorem.gsub(/[.,]/,"").split
# 	(0..4).each do |index|
# 		user_data = {}
# 		j_index = index * 3
# 		user_data[:firstname] = formatted[j_index]
# 		user_data[:lastname] = formatted[j_index + 1]
# 		user_data[:email] = formatted[j_index + 2]
# 		# puts "***** user_data: #{user_data}"
# 		@@user_data << user_data
# 		puts "*********@@user_data: #{@@user_data}"
# 	end
# end
# make_user_data
# puts "*********@@user_data: #{@@user_data}"
