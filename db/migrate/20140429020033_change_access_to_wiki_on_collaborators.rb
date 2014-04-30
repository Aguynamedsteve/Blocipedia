class ChangeAccessToWikiOnCollaborators < ActiveRecord::Migration
  def change
    remove_column :collaborators, :access, :boolean
    add_column :collaborators, :wiki_id, :integer
    add_index :collaborators, :wiki_id
  end
end
