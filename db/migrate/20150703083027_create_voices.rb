class CreateVoices < ActiveRecord::Migration
  def change
    create_table :voices do |t|
      t.string :t

      t.timestamps null: false
    end
  end
end
