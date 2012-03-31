class NotificationEmailsController < ApplicationController
  # GET /notification_emails
  # GET /notification_emails.json
  def index
    @notification_emails = NotificationEmail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notification_emails }
    end
  end

  # GET /notification_emails/1
  # GET /notification_emails/1.json
  def show
    @notification_email = NotificationEmail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @notification_email }
    end
  end

  # GET /notification_emails/new
  # GET /notification_emails/new.json
  def new
    @notification_email = NotificationEmail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @notification_email }
    end
  end

  # GET /notification_emails/1/edit
  def edit
    @notification_email = NotificationEmail.find(params[:id])
  end

  # POST /notification_emails
  # POST /notification_emails.json
  def create
    @notification_email = NotificationEmail.new(params[:notification_email])

    respond_to do |format|
      if @notification_email.save
        format.html { redirect_to @notification_email, notice: 'Notification email was successfully created.' }
        format.json { render json: @notification_email, status: :created, location: @notification_email }
      else
        format.html { render action: "new" }
        format.json { render json: @notification_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notification_emails/1
  # PUT /notification_emails/1.json
  def update
    @notification_email = NotificationEmail.find(params[:id])

    respond_to do |format|
      if @notification_email.update_attributes(params[:notification_email])
        format.html { redirect_to @notification_email, notice: 'Notification email was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @notification_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notification_emails/1
  # DELETE /notification_emails/1.json
  def destroy
    @notification_email = NotificationEmail.find(params[:id])
    @notification_email.destroy

    respond_to do |format|
      format.html { redirect_to notification_emails_url }
      format.json { head :no_content }
    end
  end
end
