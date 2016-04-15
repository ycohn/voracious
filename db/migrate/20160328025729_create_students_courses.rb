class CreateStudentsCourses < ActiveRecord::Migration
  def change
    create_table :students_courses do |t|
      t.integer :student_id
      t.integer :course_id
    end
  end
end
