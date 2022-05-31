class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.text :funfact
      t.text :description
      t.references :scenario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
