class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :exam_group_id
      t.string :name
      t.string :study

      t.timestamps null: false
    end
  end
end
