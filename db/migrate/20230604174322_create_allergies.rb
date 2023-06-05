class CreateAllergies < ActiveRecord::Migration[6.0]
  def change
    create_table :allergies do |t|
      t.string :kinds,      null: false
      t.text :notes
      t.timestamps
    end
  end
end
