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

	helpers do

		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end

		def bag_weight(bag)
			lenses_weight = bag.lenses.collect{|lens| lens.weight}.sum
			cameras_weight = bag.cameras.collect{|cameras| cameras.weight}.sum
			lenses_weight + cameras_weight
		end
	end
end