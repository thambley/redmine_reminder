class AddSendToGroupsToReminderConfigurations < ActiveRecord::Migration
  def self.up
    add_column :reminder_configurations, :send_to_groups, :boolean
  end

  def self.down
    remove_column :reminder_configurations, :send_to_groups
  end
end
