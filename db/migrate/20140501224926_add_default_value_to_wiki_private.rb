class AddDefaultValueToWikiPrivate < ActiveRecord::Migration
  def up
    change_column :wikis, :private, :boolean, :null => false
  end
end
