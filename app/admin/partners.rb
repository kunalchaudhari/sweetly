ActiveAdmin.register Partner do
  index do
    column :fullname
    column :email
    column :message
    column :zipcode
    column "Interested in", :partnertype
    column "Request on" do |partner|
      partner.created_at.strftime("%b %d, %Y")
    end
    default_actions
  end

end
