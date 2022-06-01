class RemoveScenarioFromProjects < ActiveRecord::Migration[7.0]
  def change
    remove_reference :projects, :scenario, null: false, foreign_key: true
  end
end
