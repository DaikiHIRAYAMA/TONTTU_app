class Sauna < ApplicationRecord
    has_and_belongs_to_many :timers
    belongs_to :user, optional: true
end
