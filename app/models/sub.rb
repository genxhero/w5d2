# == Schema Information
#
# Table name: subs
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  description :string           not null
#  mod_id      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ApplicationRecord
  
  validates :title, :description, presence: true
  
  belongs_to :moderator,
  primary_key: :id,
  foreign_key: :mod_id,
  class_name: 'User'
  
  has_many :sub_posts,
  primary_key: :id, 
  foreign_key: :sub_id,
  class_name: 'SubPost',
  dependent: :destroy,
  inverse_of: :post
  
  has_many :posts,
  through: :sub_posts,
  source: :post
  
  
end
