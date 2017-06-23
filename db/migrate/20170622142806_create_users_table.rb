class CreateUsersTable < ActiveRecord::Migration[5.1]
  def change
      create_table :users do |t|
          t.string :firstname
          t.string :lastname
          t.string :email
          t.string :username
          t.string :usertype
      end
  end
end
