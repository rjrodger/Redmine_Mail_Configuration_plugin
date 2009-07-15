require 'redmine'

# Patches to Redmine core
require 'dispatcher'
require 'mail_configurator_issue_patch'
#require 'mail_configurator_my_controller_patch'

Dispatcher.to_prepare do
  Issue.send(:include, MailConfiguratorIssuePatch)
#   MyController.send(:include, MailConfiguratorMyControllerPatch)
end

# Hooks
require 'mail_configurator_account_hook'
require 'mail_configurator_my_controller_hook'

Redmine::Plugin.register :redmine_mail_configurator do
  name 'Redmine Mail Configurator plugin'
  author 'Marek Kreft'
  description 'This plugin adds new options (restrictions) to prevent sending mails if not needed'
  version '0.0.1'
end
