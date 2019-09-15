class CreatePurchaseOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_options do |t|
      t.references :visual_content, null: false, foreign_key: true
      t.decimal :price, precision: 8, scale: 2, null: false
      t.integer :video_quality, null: false, default: 1

      t.timestamps
    end

    add_index :purchase_options, %i[visual_content_id price video_quality], unique: true, name: 'visual_content_price_video_quality_index'
  end
end
