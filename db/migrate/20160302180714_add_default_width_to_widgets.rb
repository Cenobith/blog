class AddDefaultWidthToWidgets < ActiveRecord::Migration
  def change
    change_column :widgets, :width, :integer, default: 160
  end
end
