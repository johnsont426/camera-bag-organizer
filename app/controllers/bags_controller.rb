class BagsController < ApplicationController

	get '/bags' do
		if logged_in?
			@user = current_user
			erb :'bags/index'
		else
			redirect '/login'
		end
	end

	get '/bags/new' do
		if logged_in?
			@user = current_user
			erb :'bags/new'
		else
			redirect '/login'
		end
	end
	
	get '/bags/:id' do
		if logged_in?
			@bag = Bag.find(params[:id])
			erb :'bags/show'
		else
			redirect '/login'
		end
	end
end