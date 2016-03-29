class CreateMediaFiles < ActiveRecord::Migration
  def change
    create_table :media_files do |t|
      t.string :name

      t.timestamps null: false
      t.integer :user_id
    end

    add_attachment :media_files, :attachment
    add_index :media_files, :user_id
  end
end
