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
		end

	end

end