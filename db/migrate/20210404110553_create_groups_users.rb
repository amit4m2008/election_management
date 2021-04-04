class CreateGroupsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :groups_users, id: false do |t|
      t.references :user, foreign_key: true, index: true
      t.references :group, foreign_key: true, index: true
    end
  end
end
