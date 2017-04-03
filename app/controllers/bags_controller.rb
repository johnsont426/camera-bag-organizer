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
		bag = user.bags.build(params)
		user.save
		redirect "/bags"
	end

	get '/bags/:id/edit' do
		if logged_in? && current_user.bags.include?(Bag.find(params[:id]))
			@bag = Bag.find(params[:id])
			erb :'bags/edit'
		else
			redirect '/bags'
		end
	end

	patch '/bags/:id' do
		bag = Bag.find(params[:id])
		bag.update(camera_ids: params[:camera_ids])
		bag.update(lens_ids: params[:lens_ids])
		bag.save
		redirect "/bags/#{bag.id}"
	end

	delete '/bags/:id' do
		bag = Bag.find(params[:id])
		if bag.user = current_user
			bag.delete
			redirect '/bags'
		else
			redirect '/bags'
		end
	end

end