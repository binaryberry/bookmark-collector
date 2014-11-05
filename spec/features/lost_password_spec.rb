require 'spec_helper'

feature "User loses his password" do

	scenario "when clicking on the forgotten password link" do
		visit '/'
		click_link("Forgotten password?")
		expect(current_path).to eq("/sessions/reset_password")
	end


end