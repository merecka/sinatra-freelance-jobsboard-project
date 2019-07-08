class OwnersController < ApplicationController

	get '/owners/signup' do
	  	if Helpers.is_logged_in?(session) && session[:user_id] != nil
	  		redirect '/users/show'
	  	elsif Helpers.is_logged_in?(session) && session[:owner_id] != nil
	  		redirect '/owners/show'
		else
			erb :'/owners/signup'
		end
  	end

  	post '/owners/signup' do
		if params[:owner_name] != "" && params[:email] != "" && params[:password] != ""
			@owner = Owner.create(owner_name: params[:owner_name], email: params[:email], password: params[:password])
			session[:owner_id] = @owner.id  #Signs in owner after creating an account
			redirect "/owners/#{@owner.id}"
		else
			redirect '/owners/signup'
		end	
  	end	

  	get '/owners/:id' do
		if Helpers.is_logged_in?(session)
			@owner = Helpers.current_user(session)
			erb :'/owners/show'
		else
			redirect '/owners/login'
		end
	end

end