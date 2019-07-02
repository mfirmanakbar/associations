class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      # we want to create 2 FK columns physician_id and patient_id in appointments table
      t.belongs_to :physician, index: true
      t.belongs_to :patient, index: true
      t.date :appointment_date
      t.timestamps
    end
  end
end
