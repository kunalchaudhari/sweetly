class RemoveCompanyFromPartners < ActiveRecord::Migration
  def up
    remove_column :partners, :company
      end

  def down
    add_column :partners, :company, :string
  end
end
