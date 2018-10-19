class CreateTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :texts do |t|
      t.bigint :text_id
      t.text :text
      t.datetime :date
      t.string :username

      t.timestamps
    end
  end
end
