class PluginProjectCustomSettings < ActiveRecord::Base
  unloadable
  
  has_one :project
  has_one :tracker
  has_one :status
  
  
  
  
  
  
  
end
