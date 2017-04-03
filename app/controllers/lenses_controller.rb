class LensesController < ApplicationController

	get '/lenses/new' do
		if logged_in?
			erb :'lenses/new'
		else
			redirect '/login'
		end
	end

	post '/lenses' do
		Lens.create(params)
		redirect '/bags'
	end

end