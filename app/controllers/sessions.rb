	get '/sessions' do
		erb :index
	end

	post '/sessions' do
		email, password = params[:email], params[:password]
		user = User.authenticate(email, password)
		if user
			session[:user_id] = user.id
			redirect to('/')
	
		else
			flash[:errors] = ["The email or password is incorrect"]
		end
	end
	get '/sessions/new' do
		erb :"sessions/new"
	end
	get '/sessions/reset_password' do
		erb :"sessions/reset_password"
	end

	post '/sessions/reset_password' do
		user = User.first(email: params[:email])
		if user.nil?
			flash[:error] = ["User not found"]
			redirect "/sessions/reset_password"
		end
		user.password_token = SecureRandom.uuid
		user.password_token_timestamp = Time.now
		user.save
		Mail.send_email(user)
		flash[:notice] = "You have been sent an email to reset your password!"
		redirect to '/'
	end

	delete '/sessions' do
		session[:user_id] = nil
		flash[:notice] = ["Goodbye!"]
		redirect to('/')
	end

	get '/sessions/password_reset' do
  		erb :"sessions/password_reset_request"
	end

	post '/sessions/password_reset' do
  		user = User.first(password_token: params[:password_token])
		p params[:password_token]
 		p user
 		user.update(password: params[:password], password_confirmation: params[:password_confirmation])
		p user
		erb :"sessions/password_reset"
	end
