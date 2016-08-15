class AddEmailToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :email, :string
  end
end
