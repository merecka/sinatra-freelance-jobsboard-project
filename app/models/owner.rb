class Owner < ActiveRecord::Base
	has_secure_password
	has_many :jobs, :autosave => true

  def slug
	slug_array = self.owner_name.split(/\s*\W/).keep_if {|v| v=~/\w/} #forms array of individual words that only include word characters (letters, numbers, underscores)
	slug_name = slug_array.join("-").downcase #creates a string with '-' in between words
  end	

  def self.find_by_slug(slug)
	found_obj = nil
	self.all.collect do |obj| 
		if obj.slug == slug  #compares if the object's slug name is equal to the provided slug name
			found_obj = obj
		end
	end
	found_obj  #returns the matching object
  end

end

