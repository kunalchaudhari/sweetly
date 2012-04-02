class Photo < ActiveRecord::Base
  belongs_to :album
  attr_accessible :album_id, :photo, :picasa_id, :sort_order, :thumbnail_1, :thumbnail_2, :thumbnail_3
end
