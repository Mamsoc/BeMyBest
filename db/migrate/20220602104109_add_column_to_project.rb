class AddColumnToProject < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :code, :string
  end
end
