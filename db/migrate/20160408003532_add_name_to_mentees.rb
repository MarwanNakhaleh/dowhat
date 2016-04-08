class AddNameToMentees < ActiveRecord::Migration
  def change
    add_column :mentees, :name, :string
  end
end
