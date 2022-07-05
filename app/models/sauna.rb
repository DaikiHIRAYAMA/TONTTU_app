class Sauna < ApplicationRecord
    has_and_belongs_to_many :timers
    belongs_to :user, optional: true

    validates :sauna_temperature, numericality: {greater_than: 0,less_than: 200}

    validates :sauna_humidity, numericality: {greater_than: 0,less_than: 200}

    validates :water_temperature, numericality: {greater_than: -50,less_than: 50}



end
