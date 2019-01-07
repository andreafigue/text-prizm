class CreateCodings < ActiveRecord::Migration[5.2]
  def change
    create_table :codings do |t|
      t.references :text, foreign_key: true
      t.references :code_1, foreign_key: {to_table: :codes}
      t.references :code_2, foreign_key: {to_table: :codes}
      t.references :topic, foreign_key: true
      t.integer :valence
      t.boolean :starred
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
