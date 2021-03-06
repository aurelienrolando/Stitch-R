class CreateReceivers < ActiveRecord::Migration[6.0]
  def change
    create_table :receivers do |t|
      t.string :email
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
