class AddTimerToSaunas < ActiveRecord::Migration[6.0]
  def change
    add_reference :saunas, :timer, foreign_key: true
  end
end
