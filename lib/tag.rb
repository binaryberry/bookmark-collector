class Tag

  # this makes the instances of this class Datamapper resources
  include DataMapper::Resource

  # This block describes what resources our model will have
  	property :id,     Serial # Serial means that it will be auto-incremented for every record
  	property :text,  String
	has n, :links, :through => Resource

end
