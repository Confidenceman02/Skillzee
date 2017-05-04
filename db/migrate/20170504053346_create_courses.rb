class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.references :user, foreign_key: true
      t.integer    :price
      t.string     :title
      t.string     :address
      t.string     :country_code
      t.string     :city
      t.string     :state
      t.text       :description
      t.integer    :max_students
      t.decimal    :lng, {precision: 10, scale: 6}
      t.decimal    :lat, {precision: 10, scale: 6}
      t.text       :notes
      t.timestamps
    end
  end
end
