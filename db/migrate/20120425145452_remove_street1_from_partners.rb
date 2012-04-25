class RemoveStreet1FromPartners < ActiveRecord::Migration
  def up
    remove_column :partners, :street1
  end

  def down
    add_column :partners, :street1, :string
  end
end
