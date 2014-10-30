	get '/sessions/new' do
		erb :"sessions/new"
	end

	post '/sessions' do
		email, password = params[:email], params[:password]
		user = User.authenticate(email, password)
		if user
			session[:user_id] = user.id
			redirect to('/')
	
		else
			flash[:errors] = ["The email or password is incorrect"]
			erb :"sessions/new"

			
		end
	end

	get '/sessions/reset_password' do
		erb :"sessions/reset_password"
	end

	post '/sessions/reset_password' do
		# email = params[:email]
	end

	delete '/sessions' do
		session[:user_id] = nil
		flash[:notice] = ["Goodbye!"]
		redirect to('/')
	end