class HomeController < ApplicationController
  before_filter :authenticate_admin_user!, :only => [:reload_showcase]

  def partners
    @partner = Partner.new
    @partner.partnertype = "Community Partner"
  end

  def goodwillband
    @partner = Partner.new
    @partner.partnertype = "Send me Goodwill bands"
  end

  def showcase
    @partner = Partner.new
    @partner.partnertype = "I am Interested !"
    @photos = Photo.all
  end

  def reload_showcase
    if params[:id].nil?
     redirect_to root_url
    else
      album = Album.new
      album.picasa_id = params[:id]
      if album.save
        photos = Picasa.photos(:google_user => 'p10sweetlydesigns', :album_id => params[:id])[:photos]

        photos.each do |photo|
          newphoto = album.photos.create
          newphoto.picasa_id = photo[:id]
          newphoto.thumbnail_1 = photo[:thumbnail_1]
          newphoto.thumbnail_2 = photo[:thumbnail_2]
          newphoto.thumbnail_3 = photo[:thumbnail_3]
          newphoto.photo = photo[:photo]
          newphoto.save
        end
      end
    end
  end
end
