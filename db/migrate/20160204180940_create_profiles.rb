class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.string :firstname
      t.string :lastname
      t.string :country
      t.boolean :use_gravatar, default: false
      t.integer :user_id

      t.timestamps null: false
    end

    add_index :profiles, :user_id,                unique: true
    add_attachment :profiles, :userpic
  end
end
