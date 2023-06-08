class CreateVaccines < ActiveRecord::Migration[6.0]
  def change
    create_table :vaccines do |t|
      t.string :vaccine_name,      null: false
      t.date   :vaccination_date,  null: false   
      t.text   :notes 
      t.timestamps
    end
  end
end
