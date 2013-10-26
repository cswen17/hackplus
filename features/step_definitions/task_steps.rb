Given /^a user visits the new task page$/ do
	visit '/newtask'
end

When /^the user submits valid task data$/ do
	fill_in "Name", with: "foo"
	fill_in "Description", with: "bar"
	fill_in "task_interest", with: "1"
	fill_in "task_duetime", with: "10/25/2013 09:08:57 PM"
	fill_in "task_length", with: "2"
	click_button "Create Task"
end

Then /^she should see the task name$/ do
	expect(page).to have_content("foo")
end