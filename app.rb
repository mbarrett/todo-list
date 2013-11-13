require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'data_mapper'
require 'json'
require File.dirname(__FILE__) + '/models.rb'

before do
	content_type 'application/json'
end

get "/" do
	content_type 'html'
	erb :index
end

get "/tasks" do
	@tasks = Task.all
	@tasks.to_json
end

post "/tasks" do
	@task = Task.new
	@task.complete = false
	@task.description = params[:description]
	@task.created_at = DateTime.now
	@task.updated_at = DateTime.now

	if @task.save
        {:task => @task, :status => "success"}.to_json
    else
        {:task => @task, :status => "failure"}.to_json
    end
end

put "/tasks/:id" do
	@task = Task.get(params[:id])
	@task.complete = params[:complete]
	@task.description = params[:description]
	@task.updated_at = DateTime.now

	if @task.save
		{:task => @task, :status => "success" }.to_json
	else
		{:task => @task, :status => "failure"}.to_json
	end
end

delete "/tasks/:id" do
	@task = Task.get(params[:id])

	if @task.destroy
		{:task => @task, :status => "success"}.to_json
	else
		{:task => @task, :status => "failure"}.to_json
	end
end

get "/getdate" do
	{:date => DateTime.now }.to_json
end