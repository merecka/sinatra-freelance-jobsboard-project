class CreateJobsUsers < ActiveRecord::Migration
  def change
  	create_table :jobs_users, id: false do |t|
	 	t.integer :job_id
	 	t.integer :user_id
  	end
  	add_index :jobs_users, :job_id
    add_index :jobs_users, :user_id
  end
end