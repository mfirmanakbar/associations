class Developer < ApplicationRecord

    # :team --> it means a developer belongs to only one team, don't write 's' as :teams
    # because belongs_to is one-to-one type of association by default 
    belongs_to :team

end