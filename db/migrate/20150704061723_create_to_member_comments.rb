class CreateToMemberComments < ActiveRecord::Migration
  def change
    create_table :to_member_comments do |t|
      t.integer :member_id
      t.boolean :good
      t.string :t

      t.timestamps null: false
    end
  end
end
