module ProjectCustomSettingsLib
    class ViewIssuesFormDetailsTopHookListener < Redmine::Hook::ViewListener
        def view_issues_form_details_top(context={})
            issue = context[:issue]
            context[:controller].send(:render_to_string, {       
                :partial => "hook/project_custom_settings/view_issues_form_details_top",
                :locals => {:issue=>issue}
            })
        end
    end
end

