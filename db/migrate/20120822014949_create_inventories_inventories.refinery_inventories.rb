# This migration comes from refinery_inventories (originally 1)
class CreateInventoriesInventories < ActiveRecord::Migration

  def up
    create_table :refinery_inventories do |t|
      t.string :title
      t.text :description
      t.string :details
      t.string :price
      t.string :address
      t.integer :image_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-inventories"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/inventories/inventories"})
    end

    drop_table :refinery_inventories

  end

end
