class AddBandTypeToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :band_type, :string
  end
end
