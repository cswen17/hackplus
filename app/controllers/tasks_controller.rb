class TasksController < ApplicationController
	def new
		@task = Task.new
	end
	def show
		@task = Task.find(params[:id])
	end
	def create
		@task = Task.new(params[:task])
		if @task.save
			flash[:success] = "Task Saved."
			redirect_to root_url
		else
			render 'new'
		end
	end
end
