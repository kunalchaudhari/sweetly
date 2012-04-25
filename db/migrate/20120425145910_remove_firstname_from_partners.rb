class RemoveFirstnameFromPartners < ActiveRecord::Migration
  def up
    remove_column :partners, :firstname
      end

  def down
    add_column :partners, :firstname, :string
  end
end
