class AddTitleToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :title, :string
  end
end
