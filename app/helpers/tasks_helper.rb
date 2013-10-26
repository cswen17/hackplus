module TasksHelper
	def calcPriority(task)
		currenttime = Time.now
		duetime = task.duetime
		diff = (currenttime - duetime)/1.hour
		if(diff < 0.1) 
			diff = 0.1
		end
		#returns a float between 0 and 10
		return 1.0 / diff
	end 

	def calcTimeEfficiency(task, priority)
		priority =  priority**2
		interest =  task.interest**2
		length = task.length
		return ((priority + interest)**0.5 / length).round(2)
	end
end
