class PluginProjectCustomSettingsController < ApplicationController
    unloadable


    def save_custom_script
        tracker_select_id = params['tracker_select_id']
        status_select_id = params['status_select_id']
        project_id = params['project_id']
        page = params['page_select']
        msg = params['msg']
        custom_type="script"
        
        customscripts = PluginProjectCustomSettings.where(["tracker_id = ? and status_id = ? and project_id = ? and page = ? and custom_type = 'script'", tracker_select_id, status_select_id, project_id, page])
        if customscripts.blank?
            customscript = PluginProjectCustomSettings.new
        else
            customscript = customscripts[0]
        end
        
        customscript.tracker_id = tracker_select_id
        customscript.status_id = status_select_id
        customscript.project_id = project_id
        customscript.msg = msg
        customscript.page = page
        customscript.custom_type = custom_type
        
        customscript.save
    end
    
    def get_custom_script
        project_id = params['project_id']
        tracker_id = params['tracker_id']
        status_id = params['status_id']
        page = params['page']
        
        customscripts = PluginProjectCustomSettings.where(["tracker_id = ? and status_id = ? and project_id = ? and page = ? and custom_type = 'script'", tracker_id, status_id, project_id,page])
        if !customscripts.blank?
            @msg = customscripts[0].msg
        else 
            @msg = ""
        end        
    
    
    end

    def save_custom_comment
        tracker_select_id = params['tracker_select_id_comment']
        status_select_id = params['status_select_id_comment']
        project_id = params['project_id_comment']
        page = params['page_select_comment']
        msg = params['msg_comment']
        custom_type="comment"
        
        customscripts = PluginProjectCustomSettings.where(["tracker_id = ? and status_id = ? and project_id = ? and page = ? and custom_type = 'comment'", tracker_select_id, status_select_id, project_id, page])
        if customscripts.blank?
            customscript = PluginProjectCustomSettings.new
        else
            customscript = customscripts[0]
        end
        
        customscript.tracker_id = tracker_select_id
        customscript.status_id = status_select_id
        customscript.project_id = project_id
        customscript.msg = msg
        customscript.page = page
        customscript.custom_type = custom_type
        
        customscript.save
    end


    def get_custom_comment
        project_id = params['project_id_comment']
        tracker_id = params['tracker_id_comment']
        status_id = params['status_id_comment']
        page = params['page_comment']
        
        customscripts = PluginProjectCustomSettings.where(["tracker_id = ? and status_id = ? and project_id = ? and page = ? and custom_type = 'comment'", tracker_id, status_id, project_id,page])

        if !customscripts.blank?
            @msg = customscripts[0].msg
        else 
            @msg = ""
        end        
    end
    
    
    def members_import_by_mail
        @result = ""
    
        mail_list_str = params['mail_list']
        splitter = params['splitter']
        project_id = params['project_id']
        import_action = params['import_action']
        mail_import_user_roles = params["mail_import_user_roles"]
        
        if !project_id.blank?
            @project = Project.find(project_id)
        else
            @result = "Error: No Project."
            return @result  
        end   
         
        
        mail_list = []
        if splitter == "n"
            mail_list = mail_list_str.split("\n")
        elsif splitter == ";"
            mail_list = mail_list_str.split(";")
        elsif splitter == ","
            mail_list = mail_list_str.split(",")
        else
            @result = "Error: Wrong Splitter." 
            return @result
        end


        project_users_email_hash = {}
        @project.users.each do |user|
            user_id = user.id
            username = (user.lastname + user.firstname).split.join('').to_s
            project_users_email_hash[user.mail.downcase] = user_id
        end
        
        users_email_hash = {}
        users_email_name_hash = {}
        User.active.all.each do |user|
            user_id = user.id
            username = (user.lastname + user.firstname).split.join('').to_s
            users_email_hash[user.mail.downcase] = user_id  
            users_email_name_hash[user.mail.downcase] = (user.lastname + user.firstname + ":" + user.mail).split.join('').to_s       
        end
        
        @users_exists_list = []
        @users_add_list = []
        @users_invalid_list = []
        
        
        
  
        if @result.blank?
            members = []
            mail_list.each do |mail_str|
                mail_str = mail_str.strip.chomp.downcase
                if project_users_email_hash.has_key? mail_str
                    @users_exists_list.push(users_email_name_hash[mail_str])
                elsif users_email_hash.has_key? mail_str
                    @users_add_list.push(users_email_name_hash[mail_str] )
                    user_id = users_email_hash[mail_str]
                    if import_action == "import"
                         members << Member.new(:role_ids => mail_import_user_roles, :user_id => user_id)                             
                    end   
                else
                    @users_invalid_list.push(mail_str)
                end
                
            end
            
            if !members.blank?
                @project.members << members
            end

        end


    
    end



end
