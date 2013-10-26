Feature: Creating tasks
	
	Scenario: Valid form data
		Given a user is signed in
		And a user visits the new task page
		When the user submits valid task data
		Then she should see the task name