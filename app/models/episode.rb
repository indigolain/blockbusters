# == Schema Information
#
# Table name: episodes
#
#  id                :bigint           not null, primary key
#  plot              :text             not null
#  position          :integer
#  title             :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  visual_content_id :bigint           not null
#
# Indexes
#
#  index_episodes_on_visual_content_id  (visual_content_id)
#
# Foreign Keys
#
#  fk_rails_...  (visual_content_id => visual_contents.id)
#

class Episode < ApplicationRecord
  belongs_to :visual_content
  validates :title,
            presence: true,
            uniqueness: true
  validates :plot, presence: true
  validates :visual_content
end
