class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :email
      t.string :request_type
      t.string :phone
      t.date :day
      t.time :time

      t.timestamps null: false
    end
  end
end
