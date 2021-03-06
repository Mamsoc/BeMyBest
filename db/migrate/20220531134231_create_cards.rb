class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :question
      t.references :scenario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
