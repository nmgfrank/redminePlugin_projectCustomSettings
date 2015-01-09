# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

match '/plugin_project_custom_settings/save_custom_script', :to => 'plugin_project_custom_settings#save_custom_script', :via => [:post]
match '/plugin_project_custom_settings/get_custom_script', :to => 'plugin_project_custom_settings#get_custom_script', :via => [:post]

match '/plugin_project_custom_settings/save_custom_comment', :to => 'plugin_project_custom_settings#save_custom_comment', :via => [:post]
match '/plugin_project_custom_settings/get_custom_comment', :to => 'plugin_project_custom_settings#get_custom_comment', :via => [:post]

match '/plugin_project_custom_settings/members_import_by_mail', :to => 'plugin_project_custom_settings#members_import_by_mail', :via => [:post]
