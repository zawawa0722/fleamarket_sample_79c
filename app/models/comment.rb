class Comment < ApplicationRecord
  belongs_to :user

  def index
  end

  validates :content, presence:true
end
