class BagsController < ApplicationController

	get '/bags' do
		erb :'bags/index'
	end

	
end