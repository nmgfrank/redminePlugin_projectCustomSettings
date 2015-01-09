require 'redmine'

require_dependency 'project_custom_settings/view_issues_form_details_bottom_hook_listener' 
require_dependency 'project_custom_settings/view_issues_form_details_top_hook_listener' 


Redmine::Plugin.register :project_custom_settings do
  name 'Project Custom Settings plugin'
  author 'nmgfrank'
  description 'We can custom-tailor some behavior in a certen project with this plugin.'
  version '0.0.1'
  url 'http://nmgfrankblog.sinaapp.com'
  author_url 'http://nmgfrankblog.sinaapp.com'
end
