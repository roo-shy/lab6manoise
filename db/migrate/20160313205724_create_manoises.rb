class CreateManoises < ActiveRecord::Migration
  def change
    create_table :manoises do |t|
      t.string :post
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
