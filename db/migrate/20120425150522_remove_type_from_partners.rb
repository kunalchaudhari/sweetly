class RemoveTypeFromPartners < ActiveRecord::Migration
  def up
    remove_column :partners, :type
      end

  def down
    add_column :partners, :type, :string
  end
end
