json.extract! sauna, :id, :name, :sauna_temperature, :sauna_humidity, :water_temperature, :created_at, :updated_at
json.url sauna_url(sauna, format: :json)
