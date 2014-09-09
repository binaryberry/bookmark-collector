require 'data_mapper'
require 'sinatra/base'
require 'rack-flash'
require './lib/link' # this needs to be done after datamapper is initialised
require './lib/tag'
require './lib/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'


class BookmarkManager < Sinatra::Base
	enable :sessions
	use Rack::Flash

	set :session_secret, 'super secret'
	set :views, File.join(root, '..', '/app/views')
	set :public_folder, File.join(root, '..', '/app/public')

	get '/' do
		@links = Link.all
		erb :index
	end

	post '/links' do
		url = params["url"]
		title = params["title"]
		tags = params["tags"].split(" ").map do |tag|
			Tag.first_or_create(:text => tag)
		end
		Link.create(:url => url, :title => title, :tags => tags)
		redirect to('/')
	end

	get '/tags/:text' do
		tag = Tag.first(:text => params[:text])
		@links = tag ? tag.links : []
		erb :index
	end

	get '/users/new' do
		@user = User.new
		erb :"users/new"
	end

	post '/users' do
		@user = User.new(:email => params[:email],
										 :password => params[:password],
										 :password_confirmation => params[:password_confirmation])
		if @user.save
			session[:user_id] = @user.id
			redirect to ('/')
		else
			flash[:notice] = "Sorry, your passwords don't match"
			erb :"users/new"
		end
	end


	# start the server if ruby file executed directly
	run! if app_file == $0
end
