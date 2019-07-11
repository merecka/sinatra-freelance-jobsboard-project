require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
   		set :session_secret, "secret"
  end

  get '/' do
  	if Helpers.is_logged_in?(session) && session[:user_id] != nil
  		redirect "/users/#{session[:user_id]}"
  	elsif Helpers.is_logged_in?(session) && session[:owner_id] != nil
  		redirect "/owners/#{session[:owner_id]}"
  	else
  		erb :index
  	end

  end

  get '/logout' do
  	session.clear
  	redirect '/'
  end


end
