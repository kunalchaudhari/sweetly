class RemoveStreet2FromPartners < ActiveRecord::Migration
  def up
    remove_column :partners, :street2
      end

  def down
    add_column :partners, :street2, :string
  end
end
