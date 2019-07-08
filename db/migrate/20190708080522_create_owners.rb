class CreateOwners < ActiveRecord::Migration
  def change
  	create_table :owners do |t|
  		t.string :owner_name
  		t.string :email
  		t.string :password_digest
  		t.timestamps
  	end
  end
end
