class CreateElections < ActiveRecord::Migration[5.2]
  def change
    create_table :elections do |t|
      t.string :name
      t.string :category
      t.belongs_to :group

      t.timestamps
    end
  end
end
