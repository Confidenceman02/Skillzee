class RenameAvatarColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :profiles, :avatar, :image_data
  end
end
