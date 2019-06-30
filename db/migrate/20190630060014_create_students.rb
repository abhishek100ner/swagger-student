class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :age
      t.text :description
      t.datetime :dob
      t.references :semester, index: true
      t.references :user, index: true
      t.timestamps
    end
  end
end
