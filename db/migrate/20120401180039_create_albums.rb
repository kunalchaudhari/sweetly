class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :picasa_id
      t.string :title
      t.text :photo

      t.timestamps
    end
  end
end
