class Owner < ActiveRecord::Base
	has_secure_password
	has_many :jobs, :autosave => true

end