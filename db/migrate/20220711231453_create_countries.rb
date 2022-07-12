class CreateCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :countries do |t|
      t.string :denomination
      t.integer :number_of_inhabitants, default: 0
      t.float :totat_surface_area
      t.references :continent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
