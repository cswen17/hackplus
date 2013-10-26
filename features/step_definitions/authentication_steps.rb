Given /^a user visits the signin page$/ do
	visit signin_path
end

When /^she submits invalid signin information$/ do
  click_button 'main_signin' #because of multiple identical signin buttons
end

Then /^she should see an error message$/ do
  expect(page).to have_selector('div.alert.alert-error')
end

Given /^the user has an account$/ do
  @user = User.create(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
end

When /^the user submits valid signin information$/ do
  fill_in "main_email",    with: @user.email
  fill_in "main_password", with: @user.password
  click_button "main_signin"
end

Then /^she should see her name$/ do
  expect(page).to have_content(@user.name)
end

Then /^she should see a signout link$/ do
  expect(page).to have_link('Sign out', href: signout_path)
end

Given /^a user is signed in$/ do
	step 'the user has an account'
	step 'a user visits the signin page'
	step 'the user submits valid signin information'
end

