class AddMessageToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :message, :text
  end
end
