# == Schema Information
#
# Table name: visual_contents
#
#  id         :bigint           not null, primary key
#  plot       :text             not null
#  title      :string           not null
#  type       :string           default("Movie"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_visual_contents_on_title  (title) UNIQUE
#  index_visual_contents_on_type   (type)
#

FactoryBot.define do
  factory :visual_content do
    sequence(:plot) { |n| "#{n}-plot" }
    sequence(:title) { |n| "#{n}-plot" }
  end
end
