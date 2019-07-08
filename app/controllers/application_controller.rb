require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
   		set :session_secret, "secret"
  end

  get '/' do
  	if Helpers.is_logged_in?(session) && session[:user_id] != nil
  		redirect '/users/show'
  	elsif Helpers.is_logged_in?(session) && session[:owner_id] != nil
  		redirect '/owners/show'
  	else
  		erb :index
  	end
  end

  get '/logout' do
  	session.clear
  	redirect '/'
  end


end
