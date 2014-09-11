require 'spec_helper'
require_relative 'helper/session'
	include SessionHelpers

feature "User signs in" do

	before(:each) do
		User.create(:email => 'test@test.com',
									:password => 'test',
									:password_confirmation => 'test')
	end

	scenario "with correct credentials" do
		visit '/'
		expect(page).not_to have_content("Welcome, test@test.com")
		sign_in('test@test.com', 'test')
		expect(page).to have_content("Welcome, test@test.com")
	end

	scenario "with incorrect credentials" do
		visit '/'
		expect(page).not_to have_content("Welcome, test@test.com")
		sign_in('test@test.com', 'wrong')
		expect(page).not_to have_content("Welcome, test@test.com")
	end

end

feature 'User signs out' do

	before(:each) do
		User.create(:email => "test@test.com",
								:password => 'test',
								:password_confirmation => 'test')
	end

	scenario 'while being signed out' do
		sign_in('test@test.com', 'test')
		click_button "sign out"
		expect(page).to have_content("Goodbye!") 
		expect(page).not_to have_content("Welcome, test@test.com")
	end

end

