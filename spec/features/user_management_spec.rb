require 'spec_helper'

feature "User signs up" do


		scenario "from homepage" do
		visit '/'
		expect(page).to have_content("Not a collector? Sign up!")
		end


		scenario "when being logged out" do
				expect { sign_up }.to change(User, :count).by(1)
				expect(page).to have_content("Welcome, alice@example.com")
				expect(User.first.email).to eq("alice@example.com")
		end

		scenario "with a password that doesn't match" do
			expect{ sign_up('a@a.com', 'pass', 'wrong') }.to change(User, :count).by(0)
			expect(current_path).to eq('/users')
			expect(page).to have_content("Sorry, your passwords don't match")
		end

		scenario "with an email that is already registered" do
			expect { sign_up }.to change(User, :count).by(1)
			expect { sign_up }.to change(User, :count).by(0)
			expect(page).to have_content("This email is already taken")
		end

end

