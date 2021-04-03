class CreateTagContents < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_contents do |t|
      t.references :tag
      t.references :content, null: false, foreign_key: true

      t.timestamps
    end
  end
end
