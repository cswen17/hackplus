require 'spec_helper'

describe "AuthenticationPages" do
	describe "sign-in" do
		before {visit signin_path}

		describe "with invalid information" do
			before {click_button "Sign in"}
			
			describe "after moving pages" do
				before { click_link "Task+"}
				it {should_not have_selector('div.alert.alert-error', text: 'Invalid')}
			end
		end

		describe "with valid information" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				fill_in "Email", with: user.email.upcase
				fill_in "Password", with: user.password
				click_button "Sign in"
			end
			it { should_not have_link("Sign in", href: signin_path) }
		end
	end
end
