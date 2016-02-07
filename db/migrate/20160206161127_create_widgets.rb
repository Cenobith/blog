class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.text :content
      t.boolean :show_pic
      t.integer :order

      t.timestamps null: false
    end
    add_attachment :widgets, :image
  end
end
