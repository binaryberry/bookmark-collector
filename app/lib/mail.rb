require 'rest_client'

class Mail

	API_KEY = ENV['MAILGUN_API_KEY']
	API_URL = "https://api:#{API_KEY}@api.mailgun.net/v2/app31128843.mailgun.org"

	def self.send_email(user)
		RestClient.post API_URL + "/messages",
		:from => "Bookmark Collector noreply@bookmark.collector",
		:to => user.email,
		:subject => "Password Reset",
		:text => "Hi! Please click on the following link to reset your password http://localhost:9393/sessions/password_reset/#{user.password_token}"
	end
end