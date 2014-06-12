class AddTypeToFees < ActiveRecord::Migration
  def change
    add_column :fees, :type, :string
    add_column :fees, :start_range, :integer
    add_column :fees, :end_range, :integer
  end
end
