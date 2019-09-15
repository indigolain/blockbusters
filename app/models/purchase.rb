# == Schema Information
#
# Table name: purchases
#
#  id                 :bigint           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  purchase_option_id :bigint           not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_purchases_on_purchase_option_id  (purchase_option_id)
#  index_purchases_on_user_id             (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (purchase_option_id => purchase_options.id)
#  fk_rails_...  (user_id => users.id)
#

class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_option

  validates :user, presence: true
  validates :purchase_option, presence: true
end
