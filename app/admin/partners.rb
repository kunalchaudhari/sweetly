ActiveAdmin.register Partner do
  index do
    column :name, :sortable => :lastname do |partner|
      "#{partner.lastname} #{partner.firstname}"
    end
    column :email
    column "Date" do |partner|
      partner.created_at.strftime("%b %d, %Y")
    end
    column :state_zip do |partner|
      "#{partner.state}&mdash;#{partner.zipcode}".html_safe
    end
    column "Parntership interest", :partnertype
    column "Goodwill Band", :band_type
    default_actions
  end
end
