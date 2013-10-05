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
			#make time attribute follow this pattern instead
			@task.update_attributes(:duetime => DateTime.strptime(params[:task][:duetime], "%m/%d/%Y %H:%M:%S %p"))
			@user = User.find(params[:task][:id])

			@user.tasks.create(params[:task])

			flash[:success] = "Task Saved."
			redirect_to root_url
		else
			render 'new'
		end
	end
end
