require 'redmine'

require_dependency 'task_link/task_update_listener'

Rails.application.config.to_prepare do
  AttachmentsController.send :include, TaskLink::AttachmentPatch
  IssueRelationsController.send :include, TaskLink::IssueRelationsPatch
end

Redmine::Plugin.register :plugin_for_Redmine do
  name 'zerocool plugin'
  author 'Zero_Cool'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/exwarvlad/plugin_for_Redmine'
  author_url 'https://github.com/exwarvlad'

  settings default: { 'request_url' => 'https://requestb.in/' },
           partial: 'settings/task_link_settings'
end
