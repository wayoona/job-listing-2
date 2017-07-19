class AddMoreDetailToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :up_bound, :integer
    add_column :jobs, :dw_bound, :integer
    add_column :jobs, :email, :string
  end
end
