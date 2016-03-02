class AddEnableToWidgets < ActiveRecord::Migration
  def change
    add_column :widgets, :enabled, :boolean, default: true
  end
end
