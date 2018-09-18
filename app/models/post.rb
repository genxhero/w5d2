# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  author_id  :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, presence: true
  
  belongs_to :author, 
  primary_key: :id, 
  foreign_key: :author_id, 
  class_name: :User 
  
  has_many :sub_posts,
  primary_key: :id, 
  foreign_key: :post_id,
  class_name: 'SubPost',
  dependent: :destroy,
  inverse_of: :sub
  
  has_many :subs,
  through: :sub_posts, #comment
  source: :sub
  
end
