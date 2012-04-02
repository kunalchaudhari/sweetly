class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :picasa_id
      t.integer :album_id
      t.text :thumbnail_1
      t.text :thumbnail_2
      t.text :thumbnail_3
      t.text :photo
      t.integer :sort_order

      t.timestamps
    end
  end
end
