class UsersController < ApplicationController

	get '/users/signup' do
	  	if Helpers.is_logged_in?(session) && session[:user_id] != nil
	  		redirect '/users/show'
	  	elsif Helpers.is_logged_in?(session) && session[:owner_id] != nil
	  		redirect '/owners/show'
		else
			erb :'/users/signup'
		end
  	end

  	post '/users/signup' do
		if params[:user_name] != "" && params[:email] != "" && params[:password] != ""
			@user = User.create(user_name: params[:user_name], email: params[:email], password: params[:password])
			session[:user_id] = @user.id  #Signs in user after creating an account
			redirect "/users/#{@user.id}"
		else
			redirect '/users/signup'
		end	
  	end

  	get '/users/login'	do
  		if Helpers.is_logged_in?(session)
  			redirect "/users/#{@owner.id}"
	  	else
	  		erb :'/users/login'
	  	end
	end

	post '/users/login' do
		@user = User.find_by(user_name: params[:user_name])
	  	if @user && @user.authenticate(params[:password])
	  		session[:user_id] = @user.id
	  		redirect "/users/#{@user.id}"  
	  	else
	  		redirect '/users/login'
	  	end
	end

  	get '/users/:id' do
		if Helpers.is_logged_in?(session)
			@user = Helpers.current_user(session)
			erb :'/users/show'
		else
			redirect '/users/login'
		end
	end

	get '/users/:slug' do
		if Helpers.is_logged_in?(session) && session[:user_id] != nil
			@user = User.find_by_slug(params[:slug])
			erb :'/users/show'
		else
			redirect '/users/login'
		end
	end

end
