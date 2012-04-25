class AddCountryToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :country, :string
  end
end
