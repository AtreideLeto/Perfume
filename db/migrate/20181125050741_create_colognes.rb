class CreateColognes < ActiveRecord::Migration[5.2]
  def change
    create_table :colognes do |t|
      t.string :name
      t.string :maker
      t.numeric :favourite
      t.string :component
      t.text :note
      t.text :info
      t.binary :picture

      t.timestamps
    end
  end
end
