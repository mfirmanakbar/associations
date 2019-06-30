class AddReferencesDevTeam < ActiveRecord::Migration[5.2]
  def change
    # > rails g migration add_team_ref_to_developers team:references
    # add_reference :table_name, :ref_name, foreign_key: true
    add_reference :developers, :team, foreign_key: true
  end
end
