class AddPartnerTypeColumnToPartner < ActiveRecord::Migration
  def change
    add_column :partners, :partnertype, :string

  end
end
