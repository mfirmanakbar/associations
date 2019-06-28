class AddClientRefToTickets < ActiveRecord::Migration[5.2]
  def change
    add_reference :tickets, :client, foreign_key: true
  end
end
