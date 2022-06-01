class ChangeCardIdNullOnMemories < ActiveRecord::Migration[7.0]
  def change
    change_column_null :memories, :card_id, true
  end
end
