class Helpers

	def self.current_user(session)
		if User.find_by(id: session[:user_id])
			user = User.find_by(id: session[:user_id])
		elsif Owner.find_by(id: session[:owner_id])
			owner = Owner.find_by(id: session[:owner_id])
		end
	end

	def self.is_logged_in?(session)
		user = User.find_by(id: session[:user_id])
		owner = Owner.find_by(id: session[:owner_id])
		user || owner ? true : false
	end

end