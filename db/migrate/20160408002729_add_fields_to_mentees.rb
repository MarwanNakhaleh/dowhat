class AddFieldsToMentees < ActiveRecord::Migration
  def change
    add_column :mentees, :dob, :date
    add_column :mentees, :bio, :text
  end
end
