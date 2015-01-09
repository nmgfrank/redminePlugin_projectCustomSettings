class CreatePluginProjectCustomSettings < ActiveRecord::Migration
  def change
    create_table :plugin_project_custom_settings do |t|
      t.integer :project_id
      t.integer :tracker_id
      t.integer :status_id
      t.string :page
      t.text :msg
      t.string :custom_type
    end
  end
end
