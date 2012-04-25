class RemoveCityFromPartners < ActiveRecord::Migration
  def up
    remove_column :partners, :city
      end

  def down
    add_column :partners, :city, :string
  end
end
