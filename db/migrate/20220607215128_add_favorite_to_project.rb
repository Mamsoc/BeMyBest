class AddFavoriteToProject < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :favorite, :boolean
  end
end
