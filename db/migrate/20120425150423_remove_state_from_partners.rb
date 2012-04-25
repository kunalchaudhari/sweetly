class RemoveStateFromPartners < ActiveRecord::Migration
  def up
    remove_column :partners, :state
      end

  def down
    add_column :partners, :state, :string
  end
end
