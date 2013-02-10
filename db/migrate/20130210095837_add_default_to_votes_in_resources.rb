class AddDefaultToVotesInResources < ActiveRecord::Migration
  def change
  	change_column :resources, :votes, :integer, :default => 0, :null => false
  end
end
