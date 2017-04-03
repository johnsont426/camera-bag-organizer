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
		bag = user.bags.build(bag_type: params[:bag_type])
		params[:cameras].each do |camera_hash|
			if !camera_hash.has_value?("")
				bag.cameras.build(camera_hash)
			end
		end
		params[:lenses].each do |lens_hash|
			if !lens_hash.has_value?("")
				bag.lenses.build(lens_hash)
			end
		end
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
		bag.bag_type = params[:bag_type]
		bag.cameras.clear
		bag.lenses.clear
		params[:cameras].each do |camera_hash|
			if !camera_hash.has_value?("")
				bag.cameras.build(camera_hash)
			end
		end
		params[:lenses].each do |lens_hash|
			if !lens_hash.has_value?("")
				bag.lenses.build(lens_hash)
			end
		end
		bag.save
		redirect "/bags/#{bag.id}"
	end



end