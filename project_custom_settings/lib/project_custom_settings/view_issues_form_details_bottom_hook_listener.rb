module ProjectCustomSettingsLib
    class ViewIssuesFormDetailsBottomHookListener < Redmine::Hook::ViewListener
        def view_issues_form_details_bottom(context={})
            issue = context[:issue]
            context[:controller].send(:render_to_string, {       
                :partial => "hook/project_custom_settings/view_issues_form_details_bottom",
                :locals => {:issue=>issue}
            })
        end
    end
end

