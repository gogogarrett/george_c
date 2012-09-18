class AddEveningPhoneToContact < ActiveRecord::Migration
  def change
    add_column :refinery_inquiries_inquiries, :evening_phone, :string
  end
end
