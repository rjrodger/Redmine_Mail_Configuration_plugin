#require_dependency 'application'
#require_dependency 'my_controller'
#
#module MailConfiguratorMyControllerPatch
#	def self.included(base) # :nodoc:
#		base.send(:include, InstanceMethods)
#        
#		base.class_eval do
#			alias_method_chain :account, :block_options
#		end
#	end
#	
#    module InstanceMethods
#
#		def account_with_block_options
#			if request.post?
#			#Params for mail notification 
#			# - block entirely mail notification
#			@user.pref[:block_mail_notification] = (params[:block_mail_notification] == '1')
#			# - mail only if assigned.
#			@user.pref[:assigned_only_mail_notification] = (params[:assigned_only_mail_notification] == '1')
#		end
#        end
#		
#    end
#end

# Hooks to add two new user preferences (for the mail configuration purpose) via account method.
class MailConfiguratorMyControllerHook  < Redmine::Hook::ViewListener
	
	def my_controller_new_user_preferences(context = { })
		
		user_pref = context[:user_pref]
		params = context[:params]
		
			#Params for mail notification 
			# - block entirely mail notification
			user_pref[:block_mail_notification] = (params[:block_mail_notification] == '1')
			# - mail only if assigned.
			user_pref[:assigned_only_mail_notification] = (params[:assigned_only_mail_notification] == '1')
	end
	
end