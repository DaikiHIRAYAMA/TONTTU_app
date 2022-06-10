class CreateSaunasTimers < ActiveRecord::Migration[6.0]
  def change
    create_table :saunas_timers do |t|
      t.references :sauna, null: false, foreign_key: true
      t.references :timer, null: false, foreign_key: true
    end
  end
end
