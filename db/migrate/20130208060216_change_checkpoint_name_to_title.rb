class ChangeCheckpointNameToTitle < ActiveRecord::Migration
  def change
  	rename_column :checkpoints, :name, :title
  end
end
