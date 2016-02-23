class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string :nickname
      t.text :content

      t.timestamps null: false
    end

    add_index :comments, :post_id
  end
end
