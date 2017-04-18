class CamerasController < ApplicationController

	get '/cameras/new' do
		if logged_in?
			erb :'cameras/new'
		else
			redirect '/login'
		end
	end

	post '/cameras' do
		if params[:name] == ""
			flash[:message] = "The camera needs to have a name"
			erb :'cameras/new'
		elsif params[:weight] == ""
			flash[:message] = "Weight can't be empty"
			erb :'cameras/new'
		else
			Camera.create(params)
			redirect '/bags'
		end
	end

	get '/cameras/:id' do
		@camera = Camera.find(params[:id])
		erb :'cameras/show'
	end

	delete '/cameras/:id' do
		camera = Camera.find(params[:id])
		camera.delete
		redirect '/bags/new'
	end

end