class PartnersController < ApplicationController
  before_filter :authenticate_admin_user!, :except => [:new, :create]

  def new
    @partner = Partner.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @partner }
    end
  end


  def create
    @partner = Partner.new(params[:partner])

    respond_to do |format|
      if @partner.save
        Notifier.partner_request(@partner, NotificationEmail.pluck(:email)).deliver
        format.html { redirect_to @partner, notice: 'Partner was successfully created.' }
        format.json { render json: @partner, status: :created, location: @partner }
        format.js 
      else
        format.html { render action: "new" }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
        format.js 
      end
    end
  end

end
