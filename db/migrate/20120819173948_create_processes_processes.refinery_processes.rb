# This migration comes from refinery_processes (originally 1)
class CreateProcessesProcesses < ActiveRecord::Migration

  def up
    create_table :refinery_processes do |t|
      t.string :title
      t.text :description
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-processes"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/processes/processes"})
    end

    drop_table :refinery_processes

  end

end
