class AddBirthdayToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :birthday, :timestamp  	
  end
end
