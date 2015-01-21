require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'securerandom'

require_relative 'models/link'
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


	enable :sessions
	use Rack::Flash
	use Rack::MethodOverride

	set :session_secret, 'super secret'


