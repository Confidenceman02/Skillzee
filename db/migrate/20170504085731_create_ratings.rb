class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references :booking, foreign_key: true
      t.text       :description
      t.integer    :score
      t.timestamps
    end
  end
end
