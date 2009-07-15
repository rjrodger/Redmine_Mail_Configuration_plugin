require_dependency 'issue'

module MailConfiguratorIssuePatch
      def self.included(base) # :nodoc:
        base.send(:include, InstanceMethods)
        
            base.class_eval do
                alias_method_chain :recipients, :mail_configurator
            end
      end
	
    module InstanceMethods

        # Adds new restrictions in recipments method to block sending mail
        def recipients_with_mail_configurator
          
          # This will block mail notification for all projects (and at any conditions) for users that selected blocking option
          blocked_mails = project.members.select { |m| m.user.pref[:block_mail_notification]== true }.collect {|m| m.user.mail}
          # This is mail blocker for users that don't want to be notificated if they are not assigned to issue
          only_for_assigned_option_mails = project.members.select { |m| m.user.pref[:assigned_only_mail_notification] == true }.collect {|m| m.user.mail}
          
          recipients = recipients_without_mail_configurator						
          recipients = recipients - only_for_assigned_option_mails 
          recipients << assigned_to.mail if assigned_to && assigned_to.active?
          recipients = recipients - blocked_mails
          recipients.compact.uniq
        end
	
    end
end
