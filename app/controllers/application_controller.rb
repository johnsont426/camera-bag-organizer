class ApplicationController < Sinatra::Base
	
	use Rack::Flash

	configure do
		set :public_folder, 'public'
		set :views, 'app/views'
		enable :sessions
		set :session_secret, 'secret'
	end

	get '/' do
		erb :index
	end

	get '/signup' do
		erb :signup
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
		erb :login
	end

	post '/login' do
		@user = User.find_by(username: params)
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







end