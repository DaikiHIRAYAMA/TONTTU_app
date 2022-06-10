class RemoveTimersIdFromSaunas < ActiveRecord::Migration[6.0]
  def change
    remove_reference :saunas, :timer, foreign_key: true
  end
end
