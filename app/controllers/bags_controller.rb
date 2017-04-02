class BagsController < ApplicationController

	get '/bags' do
		if logged_in?
			@user = current_user
			erb :'bags/index'
		else
			redirect '/login'
		end
	end


end