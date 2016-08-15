class ChangeEmailToName < ActiveRecord::Migration
  def change
  	rename_column :requests, :email, :name
  end
end
