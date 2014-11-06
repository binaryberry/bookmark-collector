# require 'controllers/users'
# require 'controllers/sessions'
# require 'controllers/links'
# require 'controllers/tags'
# require 'controllers/application'



env = ENV["RACK_ENV"] || "development"
DataMapper.setup(:default, "postgres://localhost/bookmark-collector_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!
