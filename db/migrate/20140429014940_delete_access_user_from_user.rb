class DeleteAccessUserFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :access, :boolean
    remove_column :users, :user_id, :integer
  end
end
