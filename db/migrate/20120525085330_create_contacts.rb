class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :fname
      t.string :lname
      t.text   :address
      t.string :city
      t.string :country
      t.string :state
      t.string :mobile
      t.integer :user_id


      t.timestamps
    end
  end
end
