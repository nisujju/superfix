class AddUserAddressToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :user_address, :string
  end
end
