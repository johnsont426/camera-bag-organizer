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

	post '/bags' do
		user = current_user
		bag = user.bags.build(type: params[:type])
		params[:cameras].each do |camera_hash|
			bag.cameras.build(camera_hash)
		end
		params[:lenses].each do |lens_hash|
			bag.lenses.build(lens_hash)
		end
		user.save
	end

end