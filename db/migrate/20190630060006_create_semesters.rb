class CreateSemesters < ActiveRecord::Migration[5.1]
  def change
    create_table :semesters do |t|
      t.string :name
      t.integer :credits
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, index: true
      t.timestamps
    end
  end
end
