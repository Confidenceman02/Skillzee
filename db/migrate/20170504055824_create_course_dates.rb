class CreateCourseDates < ActiveRecord::Migration[5.0]
  def change
    create_table :course_dates do |t|
      t.references  :course, foreign_key: true
      t.date        :date
      t.time        :time
      t.timestamps
    end
  end
end
