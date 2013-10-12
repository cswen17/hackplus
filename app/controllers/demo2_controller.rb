class Demo2Controller < ApplicationController
	def sortTasksbyPriority
    	@user = User.find(params[:id])
    	@user.tasks.order("interest DESC").all
    	redirect_to root_url
  	end
end
