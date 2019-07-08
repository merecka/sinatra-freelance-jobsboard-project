class CreateJobs < ActiveRecord::Migration
  def change
  	create_table :jobs do |t|
  		t.belongs_to :owner, index: true
  		t.string :title
  		t.string :job_hours
  		t.string :job_description
  		t.integer :salary
  		t.timestamps
  	end

  end
end
