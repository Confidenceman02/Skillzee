class CreateCourseCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :course_categories do |t|
      t.references :course, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
