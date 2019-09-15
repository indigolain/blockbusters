# == Schema Information
#
# Table name: purchase_options
#
#  id                :bigint           not null, primary key
#  price             :decimal(8, 2)    not null
#  video_quality     :integer          default("HD"), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  visual_content_id :bigint           not null
#
# Indexes
#
#  index_purchase_options_on_visual_content_id  (visual_content_id)
#  visual_content_price_video_quality_index     (visual_content_id,price,video_quality) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (visual_content_id => visual_contents.id)
#

FactoryBot.define do
  factory :purchase_option do
    price { Faker::Number.decimal(l_digits: 2) }
    video_quality { PurchaseOption.video_qualities.keys.sample }
    association :visual_content
  end
end
