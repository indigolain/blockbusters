# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ApplicationRecord
  has_many :purchases, -> { order(:created_at) }
  has_many :purchased_options,
           through: :purchases,
           source: :purchase_option
  has_many :purchased_contents,
           through: :purchased_options,
           source: :visual_content

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }
end
