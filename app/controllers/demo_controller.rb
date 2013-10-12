class DemoController < ApplicationController
	def new
	end
	def sortTasksbyPriority
        @user = User.find(params[:id])
        @user.tasks.order("interest DESC").all
        redirect_to root_url
    end
    helper_method :sortTasksbyPriority
end
