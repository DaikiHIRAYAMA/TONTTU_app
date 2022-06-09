class AddSaunaToTimers < ActiveRecord::Migration[6.0]
  def change
    add_reference :timers, :sauna, foreign_key: true
  end
end
