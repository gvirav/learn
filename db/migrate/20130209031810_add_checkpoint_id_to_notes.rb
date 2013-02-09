class AddCheckpointIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :checkpoint_id, :integer
  end
end
