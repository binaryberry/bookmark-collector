require 'data_mapper'
require 'sinatra/base'
env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './lib/link' # this needs to be done after datamapper is initialised
require './lib/tag' 


DataMapper.finalize
DataMapper.auto_upgrade!

class BookmarkManager < Sinatra::Base

  set :views, File.join(root, '..', 'views')
  set :public_folder, File.join(root, '..', 'public')

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
  # start the server if ruby file executed directly
  run! if app_file == $0
end
