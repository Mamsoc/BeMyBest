class AddScenarioToProjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :scenario, null: true, foreign_key: true
  end
end
