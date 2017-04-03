class CamerasController < ApplicationController

	get '/cameras/new' do
		if logged_in?
			erb :'cameras/new'
		else
			redirect '/login'
		end
	end

	post '/cameras' do
		Camera.create(params)
		redirect '/bags'
	end

end