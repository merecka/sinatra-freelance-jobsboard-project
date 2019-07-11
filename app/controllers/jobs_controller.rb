require 'rack-flash'

class JobsController < ApplicationController

	use Rack::Flash

	get '/jobs' do
		if Helpers.is_logged_in?(session)
			erb :'/jobs/all'
		else
			redirect '/'
		end
	end

	patch '/jobs/:id' do
		if Helpers.is_logged_in?(session)
			@job = Job.find_by_id(params[:id])
			erb :'/jobs/show'
		else
			redirect '/'
		end
	end

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
			if params[:title] != "" && params[:job_hours] != nil && params[:job_description] != "" && params[:salary] != ""
				@job = Job.create(title: params[:title], job_hours: params[:job_hours], job_description: params[:job_description], salary: params[:salary])
				@owner = Helpers.current_user(session)
				@job.owner = @owner
				@job.save
				flash[:create] = "Successfully created job."
				redirect "/owners/#{@owner.id}"
			else
				redirect '/jobs/new'
			end
		else
			redirect '/owners/login'
		end
	end

	get '/jobs/:id/edit' do
		if Helpers.is_logged_in?(session) && session[:owner_id] != nil
			@job = Job.find_by(id: params[:id])
			@owner = Owner.find_by(id: session[:owner_id])
			if @job.owner == @owner
				erb :'/jobs/edit'
			else
				redirect "/owners/#{@owner.id}"
			end
		else
			redirect '/'
		end
	end

	patch '/jobs/:id/edit' do
		if Helpers.is_logged_in?(session) && session[:owner_id] != nil
			@job = Job.find_by(id: params[:id])
			@owner = Owner.find_by(id: session[:owner_id])
			if params[:title] != "" && params[:job_hours] != nil && params[:job_description] != "" && params[:salary] != ""
				@job.update(title: params[:title], job_hours: params[:job_hours], job_description: params[:job_description], salary: params[:salary])
				flash[:edit] = "Successfully updated job."
				redirect "/owners/#{@owner.id}"
			else
				redirect "/jobs/#{@job.id}/edit"
			end
		else
			redirect '/'
		end
	end

	patch '/jobs/apply/:id' do
		if Helpers.is_logged_in?(session) && session[:user_id] != nil
			@job = Job.find_by(id: params[:id])
			@user = User.find_by(id: session[:user_id])
			if !@user.jobs.include?(@job)  #Only allows user to apply for a job which they haven't already applied for.
				@user.jobs << @job
				@user.save
			end
			redirect "/users/#{@user.id}"
		else
			redirect '/'
		end
	end

	patch '/jobs/unapply/:id' do
		if Helpers.is_logged_in?(session) && session[:user_id] != nil
			@job = Job.find_by(id: params[:id])
			@user = User.find_by(id: session[:user_id])
			@user.jobs.delete(params[:id])
			@user.save
			redirect "/users/#{@user.id}"
		else
			redirect '/'
		end
	end

	delete '/jobs/:id/delete' do
		if Helpers.is_logged_in?(session) && session[:owner_id] != nil
			@owner = Owner.find_by(id: session[:owner_id])
			@job = Job.find_by(id: params[:id])

			if @job.owner_id == @owner.id
				@job.destroy
				redirect "/owners/#{@owner.id}"
			else
				redirect "/owners/#{@owner.id}"
			end
		else
			redirect '/'
		end
  	end
end