class Album < ActiveRecord::Base
  has_many :photos
  attr_accessible :photo, :picasa_id, :title
end
