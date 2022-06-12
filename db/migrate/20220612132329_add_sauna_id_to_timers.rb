class AddSaunaIdToTimers < ActiveRecord::Migration[6.0]
  def change
    add_column :timers, :sauna_id, :integer
  end
end
