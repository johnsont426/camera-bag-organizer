class UsersController < ApplicationController

	get '/signup' do
		erb :'users/signup'
	end

	post '/signup' do
		if params[:username] == "" || params[:password] == ""
			flash[:message] = "Please enter username and password!"
			redirect '/signup'
		elsif params[:password].length < 8
			flash[:message] = "Your password is too short!"
			redirect '/signup'
		else
			user = User.new(params)
			user.save
			redirect '/login'
		end

	end

	get '/login' do
		erb :'users/login'
	end

	post '/login' do
		@user = User.find_by(username: params[:username])
		if !@user
			flash[:message] = "Can't find the username"
			redirect '/login'
		elsif @user && !@user.authenticate(params[:password])
			flash[:message] = "Wrong password"
			redirect '/login'
		else
			session[:user_id] = @user.id
			redirect '/bags'
		end
	end

	get '/logout' do
		session.clear
		redirect '/'
	end
	
end