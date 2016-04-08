class AddOccupationToMentors < ActiveRecord::Migration
  def change
    add_column :mentors, :occupation, :string
  end
end
