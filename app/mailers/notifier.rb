class Notifier < ActionMailer::Base
  default from: "kunalchaudhari@gmail.com"

  def partner_request(partner, recipients)
    @partner = partner
    mail(:to => recipients, :subject => "#{partner.partnertype} - #{partner.lastname} #{partner.firstname}")
  end
end
