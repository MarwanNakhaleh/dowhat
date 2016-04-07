class AddFieldsToMentor < ActiveRecord::Migration
  def change
    add_column :mentors, :provider, :string
    add_column :mentors, :uid, :string
  end
end
