class RemoveFunfactFromProjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :funfact, :text
  end
end
