require 'data_mapper'
require './app/data_mapper_setup'
require './app/server'

task :auto_upgrade do
	DataMapper.auto_upgrade!
	puts "Auto-upgrade complete (no data loss)"
end

task :auto-migrate do
DataMapper.auto_migrate!
	puts "Auto-migrate complete (data coould have been lost)"
end

