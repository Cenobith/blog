class AddLinkToWidgets < ActiveRecord::Migration
  def change
    add_column :widgets, :link, :string
  end
end
