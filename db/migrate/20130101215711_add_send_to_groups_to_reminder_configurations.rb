class AddSendToGroupsToReminderConfigurations < ActiveRecord::Migration
  def self.up
    unless column_exists? :reminder_configurations, :send_to_groups
      add_column :reminder_configurations, :send_to_groups, :boolean
    end
  end

  def self.down
    if column_exists? :reminder_configurations, :send_to_groups
      remove_column :reminder_configurations, :send_to_groups
    end
  end
end
