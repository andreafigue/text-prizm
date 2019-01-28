class AddBatchToTexts < ActiveRecord::Migration[5.2]
  def change
    add_reference :texts, :batch, foreign_key: true
  end
end
