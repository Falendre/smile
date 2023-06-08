class CreateUnderlyingConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :underlying_conditions do |t|
      t.references :user,           null: false, foreign_key: true
      t.string :details,          null: false
      t.date   :diagnosis_date,   null: false
      t.text   :notes
      t.timestamps
    end
  end
end
