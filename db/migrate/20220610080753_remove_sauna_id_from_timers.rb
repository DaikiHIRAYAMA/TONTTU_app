class RemoveSaunaIdFromTimers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :timers, :sauna, foreign_key: true
  end
end
