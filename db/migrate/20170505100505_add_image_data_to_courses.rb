class AddImageDataToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :image_data, :text
  end
end
