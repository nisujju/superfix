class AddingNametypeToRequests < ActiveRecord::Migration
  def change
  	change_column :requests, :name, :string
  end
end
