class AddAddressToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :address, :text
  end
end
