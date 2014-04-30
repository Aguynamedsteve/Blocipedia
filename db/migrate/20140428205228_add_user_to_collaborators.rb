class AddUserToCollaborators < ActiveRecord::Migration
  def change
    add_column :collaborators, :user_id, :integer
    add_column :collaborators, :access, :boolean
  end
end
