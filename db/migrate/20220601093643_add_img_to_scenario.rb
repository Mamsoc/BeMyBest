class AddImgToScenario < ActiveRecord::Migration[7.0]
  def change
    add_column :scenarios, :img, :string
  end
end
