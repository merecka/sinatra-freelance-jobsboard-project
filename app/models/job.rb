class Job < ActiveRecord::Base
	belongs_to :owner, :autosave => true
	has_and_belongs_to_many :users, :autosave => true

end