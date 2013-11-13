#DataMapper::Logger.new($stdout, :debug)
#DataMapper.setup(:default, 'postgres://localhost/todo-db')
DataMapper.setup(:default, 'postgres://grerrjuorqwmxp:5KPVSqD63ZpSQ1fUmalMATbnnY@ec2-23-23-80-55.compute-1.amazonaws.com/d5ndetmmtlm6gv')

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