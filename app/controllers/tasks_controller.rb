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
			params[:task][:duetime] = DateTime.strptime(params[:task][:duetime], 
												"%m/%d/%Y %H:%M:%S %p")
			#make time attribute follow this pattern instead
			@user = User.find(params[:task][:id])

			@user.tasks.create(params[:task])

			flash[:success] = "Task Saved."
			redirect_to root_url
		else
			render 'new'
		end
	end

	def destroy
		@task = Task.find(params[:id])
		@task.delete
		redirect_to root_url
	end

	def complete
		@task = Task.find(params[:id])
		@task.update_attribute(:completed, true)
		redirect_to root_url
	end
end
