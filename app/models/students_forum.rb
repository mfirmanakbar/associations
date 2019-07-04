class StudentsForum < ApplicationRecord
    belongs_to :student
    belongs_to :forum
end