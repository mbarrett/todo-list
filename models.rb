#DataMapper::Logger.new($stdout, :debug)
#DataMapper.setup(:default, 'postgres://localhost/todo-db')
DataMapper.setup(:default, 'postgres://ruxslksqjjfyvx:0vHBQzH6z4T2_AuoFUr96JnhB4@ec2-54-217-239-27.eu-west-1.compute.amazonaws.com:5432/d20jabf0992aa6')

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