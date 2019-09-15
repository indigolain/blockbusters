class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.references :visual_content, null: false, foreign_key: true
      t.string :title, null: false
      t.text :plot, null: false
      t.integer :position

      t.timestamps
    end
  end
end
