require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'securerandom'

require_relative 'models/link' # this needs to be done after datamapper is initialised
require_relative 'models/tag'
require_relative 'models/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'
require_relative 'lib/mail'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/links'
require_relative 'controllers/tags'
require_relative 'controllers/application'


# class BookmarkManager < Sinatra::Base
	enable :sessions
	# register Sinatra::Partial
	use Rack::Flash
	use Rack::MethodOverride

	set :session_secret, 'super secret'

	
	# start the server if ruby file executed directly
	# run! if app_file == $0

