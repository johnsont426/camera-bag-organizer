class LensesController < ApplicationController

	get '/lenses/new' do
		if logged_in?
			erb :'lenses/new'
		else
			redirect '/login'
		end
	end

	post '/lenses' do
		if params[:name] == ""
			flash[:message] = "The lens needs to have a name"
			erb :'lenses/new'
		elsif params[:weight] == ""
			flash[:message] = "Weight can't be empty"
			erb :'lenses/new'
		else
			Lens.create(params)
			redirect '/bags/new'
		end
	end

	get '/lenses' do
		@lenses = Lens.all
		erb :'lenses/index'
	end

	delete '/lenses/:id' do
		lens = Lens.find(params[:id])
		lens.delete
		redirect '/bags/new'
	end

end