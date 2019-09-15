class CreateVisualContents < ActiveRecord::Migration[6.0]
  def change
    create_table :visual_contents do |t|
      t.string :title, null: false
      t.text :plot, null: false
      t.string :type, null: false, default: 'Movie'

      t.timestamps
    end

    add_index :visual_contents, :title, unique: true
    add_index :visual_contents, :type
  end
end
