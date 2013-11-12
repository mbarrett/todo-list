#DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'sqlite::memory:')

class Task
	include DataMapper::Resource

	property :id, Serial
	property :complete, Boolean
	property :description, Text
	property :created_at, DateTime
	property :updated_at, DateTime

end

DataMapper.finalize
DataMapper.auto_upgrade!