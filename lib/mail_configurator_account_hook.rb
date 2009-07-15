# Hooks to attach to the "my account" two additional checkboxes.
class MailConfiguratorAccountHook  < Redmine::Hook::ViewListener
	
# Renders two checkboxes to the <div class="box"> tag from my account page
  def mail_configurator_options(context = { })
	
	user_pref = context[:user_pref]
	
	content =  "<p><label>#{ check_box_tag 'assigned_only_mail_notification', 1, user_pref[:assigned_only_mail_notification]} #{ l(:label_user_mail_assigned_only_mail_notification)}</label></p><p><label>#{check_box_tag 'block_mail_notification', 1, user_pref[:block_mail_notification]}#{l(:label_user_mail_block_mail_notification)}</label></p>"
	return content
  end

end