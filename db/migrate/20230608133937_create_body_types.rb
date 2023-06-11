class CreateBodyTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :body_types do |t|
      t.references :user,        null: false, foreign_key: true
      t.date :measurement_date,  null: false
      t.string :height,          null: false
      t.string :weight,          null: false
      t.text :notes
      t.timestamps
    end
  end
end
