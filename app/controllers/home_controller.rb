class HomeController < ApplicationController

  def partner
    @partner = Partner.new
    @partner.partnertype = "I want to be Wholesale Partner"
  end

  def sjs
    @partner = Partner.new
    @partner.partnertype = "I want to Host SJS"
  end
end
