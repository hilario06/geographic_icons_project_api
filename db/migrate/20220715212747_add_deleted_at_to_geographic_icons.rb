class AddDeletedAtToGeographicIcons < ActiveRecord::Migration[6.1]
  def change
    add_column :geographic_icons, :deleted_at, :datetime
    add_index :geographic_icons, :deleted_at
  end
end
