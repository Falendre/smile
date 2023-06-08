class CreateMedications < ActiveRecord::Migration[6.0]
  def change
    create_table :medications do |t|
      t.date :prescription_date,     null: false   
      t.text :notes
      t.timestamps
    end
  end
end
