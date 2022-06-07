class CreateTimers < ActiveRecord::Migration[6.0]
  def change
    create_table :timers do |t|
      
      t.datetime :sauna_start_time
      t.datetime :sauna_finish_time
      t.datetime :water_start_time
      t.datetime :water_finish_time
      t.datetime :outside_start_time
      t.datetime :outside_finish_time
      t.datetime :sauna_deadline
      t.datetime :water_deadline      

      t.timestamps
    end
  end
end
