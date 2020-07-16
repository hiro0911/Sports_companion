class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :sns_credentials, dependent: :destroy

  has_many :comments
  has_many :team_members, dependent: :destroy
  has_many :team_comments
  has_many :likes, dependent: :destroy
  has_many :liked_comments, through: :likes, source: :post # userがどの投稿をいいねしているのかを取得
  has_many :teams, through: :team_members
  has_many :events

  validates :name, presence: true

  enum sex: {男性:1, 女性:2}

  def already_liked?(comment)
  	self.likes.exists?(comment_id: comment.id)
  end

end
