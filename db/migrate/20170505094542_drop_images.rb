class DropImages < ActiveRecord::Migration[5.0]
  def up
    drop_table :images
  end

  def  down
    fail ActiveRecord::IrreversibleMigration
  end
end
