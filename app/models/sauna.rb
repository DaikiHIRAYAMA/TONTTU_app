class Sauna < ApplicationRecord
    has_many :Timers, dependent: :destroy
end
