class AddStuffToMentor < ActiveRecord::Migration
  def change
    add_column :mentors, :token, :string
    add_column :mentors, :secret, :string
  end
end
