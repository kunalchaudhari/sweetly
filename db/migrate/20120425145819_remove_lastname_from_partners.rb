class RemoveLastnameFromPartners < ActiveRecord::Migration
  def up
    remove_column :partners, :lastname
      end

  def down
    add_column :partners, :lastname, :string
  end
end
