class CreateAccountHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :account_histories do |t|
      t.string :activity
      t.timestamps
    end
  end
end
