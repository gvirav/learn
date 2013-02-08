class AddGoalIdToCheckpoints < ActiveRecord::Migration
  def change
    add_column :checkpoints, :goal_id, :integer
  end
end
