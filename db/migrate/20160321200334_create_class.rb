class CreateClass < ActiveRecord::Migration
  def change
    create_table :classes do |t|
      t.string :name
      t.integer :student_id
      t.integer :teacher_id
    end
  end
end
