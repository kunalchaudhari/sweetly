class Partner < ActiveRecord::Base
  validates_presence_of :lastname, :on => :create, :message => "can't be blank"
  validates_presence_of :firstname, :on => :create, :message => "can't be blank"
  validates_presence_of :email, :on => :create, :message => "can't be blank"
end
