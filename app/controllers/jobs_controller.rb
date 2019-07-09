class JobsController < ApplicationController

	get '/jobs/new' do
		if Helpers.is_logged_in?(session) && session[:owner_id] != nil
			@owner = Owner.find_by(id: session[:owner_id])
			erb :'/jobs/new'
		else
			redirect '/owners/login'
		end
	end

	post '/jobs/new' do
		if Helpers.is_logged_in?(session) && session[:owner_id] != nil 
			if params[:title] != "" && params[:job_hours] != "" && params[:job_description] != "" && params[:salary] != ""
				@job = Job.create(title: params[:title], job_hours: params[:job_hours], job_description: params[:job_description], salary: params[:salary])
				@owner = Helpers.current_user(session)
				@job.owner = @owner
				@job.save
				redirect "/owners/#{@owner.id}"
			else
				redirect '/jobs/new'
			end
		else
			redirect '/owners/login'
		end
	end

end