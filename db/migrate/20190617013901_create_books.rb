class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :isbn
      t.text :authors, array: true, default: []
      t.string :country
      t.integer :number_of_pages
      t.string :publisher
      t.string :release_date


      t.timestamps
    end
  end
end
