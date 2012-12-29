require 'redmine'
require 'dynamic_form'

ActionDispatch::Callbacks.to_prepare do
  require_dependency 'tracker'
  require_dependency 'redmine_reminder/hooks'
  unless Tracker.included_modules.include? RedmineReminder::TrackerPatch
    Tracker.send :include, RedmineReminder::TrackerPatch
  end
end

Redmine::Plugin.register :redmine_reminder do
  name 'Advanced reminder'
  author 'Milan Stastny of ALVILA SYSTEMS'
  description 'E-mail notification of issues due date you are involved in (Assignee, Author, Watcher)'
  version '0.0.10'
  url 'https://github.com/thambley/redmine_reminder'
  requires_redmine :version_or_higher => '2.1.0'
end

Redmine::MenuManager.map :admin_menu do |menu|
  menu.push :reminder_options, {:controller => :reminder_configuration, :action => :edit}, :caption => :label_reminder_options
end

