class CreateThinks < ActiveRecord::Migration
  def change
    create_table :thinks do |t|
      t.integer :member_id
      t.integer :user_id
      t.boolean :good

      t.timestamps null: false
    end
  end
end
