require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base

end

class Order < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 3 }
	validates :phone, presence: true, length: { minimum: 5 }
	validates :adress, presence: true
	validates :pizza, presence: true
end

before do
@products = Product.all
end


get '/' do
	erb :index
end

get '/about' do
	erb :about
end


post '/cart' do
	@c = Order.new params[:orders]
	erb :cart
end


post '/order' do
	@c = Order.new params[:orders]
	if @c.save
		erb "<h2>Спасибо, за заказ!</h2>"
	else
		@error = @c.errors.full_messages.first
		erb :cart
	end
end