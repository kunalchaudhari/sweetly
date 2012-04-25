class RemoveZipcodeFromPartners < ActiveRecord::Migration
  def up
    remove_column :partners, :zipcode
      end

  def down
    add_column :partners, :zipcode, :string
  end
end
