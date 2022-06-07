class AddBestyFirstNameToProject < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :besty_first_name, :string
  end
end
