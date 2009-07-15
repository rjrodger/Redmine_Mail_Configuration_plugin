## Redmine Mail Configuration plugin

The Mail Configuration plugin will add to Your Redmine 'My account' site two new checkboxes in 'Email notifications' area. 
First option will allow sending mail notification only if user is assigned to the issue. Second will block sending mail completly.

## Getting the plugin

## Install

This plugin needs to be installed same as the Redmine instruction for plugins describes (http://www.redmine.org/wiki/1/Plugins).
You can skip 'rake' command as there are no database migration files.
You have to also rn the patch file from redmine_mail_configurator\patch\
It will only add two hooks in your source code, so the changes are insignificant, but still you should BACKUP Your Files.

## Features

The Mail Configuration plugin will add to Your Redmine 'My account' site two new checkboxes in 'Email notifications' area. 
First option will allow sending mail notification only if user is assigned to the issue. Second will block sending mail completly.

Changes made by patch:

<redmine root>\app\controllers\my_controller.rb

	@user.pref[:no_self_notified] = (params[:no_self_notified] == '1')

	######++ call_hook(:my_controller_new_user_preferences, { :params => params, :user_pref => @user.pref })

	if @user.save


<redmine root>\app\views\my\account.rhtml

	<p><label><%= check_box_tag 'no_self_notified', 1, @user.pref[:no_self_notified] %> <%= l(:label_user_mail_no_self_notified) %></label></p>

	######++<%= call_hook(:mail_configurator_options, { :user_pref => @user.pref }) %>

	</div>


![New configuration options](http://github.com/GOYELLO/Redmine_Mail_Configuration_plugin/blob/4190f1229e9746e897ab9dcbc819d06130dd10b1/New_mail_configuration_options.jpg)