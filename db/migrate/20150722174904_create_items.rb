class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.date :start, null: false
      t.date :end, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
