## redminePlugin_projectCustomSettings

This is a redmine plugin which now only support redmine 2.3.2 to redmine 2.3.3.

To deploy this plugin, you should copy ./project_custom_settings into plugins folder of redmine.

This plugin offers some tools for the project managers.

####1. Custom Comment

* Set Tracker
* Set Status
* Set Page
* Set Content of Comment

![image](https://github.com/nmgfrank/redminePlugin_projectCustomSettings/blob/master/readme_pic/comment_setting.jpg)

When tracker is 'Bug', status is 'New Creation', page is 'issue_edit', content of comment is '测试用！测试用！', 
on the editing page of bug trackers, if the status is 'New Creation', we will see comment  '测试用！测试用！' on the page.

![image](https://github.com/nmgfrank/redminePlugin_projectCustomSettings/blob/master/readme_pic/comment_show.jpg)


####2. Custom Script

* Set Tracker
* Set Status
* Set Page
* Set Content of Script

Notice: It is dangerous to add javascript into page. It must be running well otherwise the page will break down.

![image](https://github.com/nmgfrank/redminePlugin_projectCustomSettings/blob/master/readme_pic/script_edit.jpg)

If the script is 'alert(1);' , then an alert appears on the related page.

![image](https://github.com/nmgfrank/redminePlugin_projectCustomSettings/blob/master/readme_pic/script_show.jpg)

####3. Batch Members Import

With the help of this module, users can add list of users as project members.

There are three lists on the bottom of the page. First one contain s the mails those can not be found in redmine. Second one contains ones those exist in redmine but are not members of current project ( or just be added as members of current project ). Third one ontains ones those are already members.

It has two modes. In mode of `Analyze`, system only analyze the status of mails while in mode of `Import`, system makes all the users with valid mails into members of current project. 

![image](https://github.com/nmgfrank/redminePlugin_projectCustomSettings/blob/master/readme_pic/users.jpg)











