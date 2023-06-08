class CreateAllergies < ActiveRecord::Migration[6.0]
  def change
    create_table :allergies do |t|
      t.references :user,    null: false, foreign_key: true
      t.string     :kinds,      null: false
      t.text       :notes
      t.timestamps
    end
  end
end
