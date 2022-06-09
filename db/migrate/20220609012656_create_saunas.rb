class CreateSaunas < ActiveRecord::Migration[6.0]
  def change
    create_table :saunas do |t|
      t.string :name, :default => "平均的なサウナ", :null => false
      t.integer :sauna_temperature,  :default => 90, :null => false
      t.integer :sauna_humidity, :default => 10, :null => false
      t.integer :water_temperature,  :default => 20, :null => false

      t.timestamps
    end
  end
end
