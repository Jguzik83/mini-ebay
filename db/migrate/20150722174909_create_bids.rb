class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.float :amount, null: false
      t.integer :user_id
      t.integer :item_id

      t.timestamps null: false
    end
  end
end
