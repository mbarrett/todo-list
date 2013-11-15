#DataMapper::Logger.new($stdout, :debug)
#DataMapper.setup(:default, 'postgres://localhost/todo-db')
DataMapper.setup(:default, 'postgres://potkcyehhyvape:60qOcGkUUoiinfM2NO49gJoiNO@ec2-54-204-36-244.compute-1.amazonaws.com:5432/d9am60mfei9g48')

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