class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :omniauthable, omniauth_providers: %i(google)

  validates :name, presence: true, length: { minimum: 1, maximum: 20 }

  has_many :comments
  has_many :team_members, dependent: :destroy
  has_many :team_comments
  has_many :likes, dependent: :destroy
  has_many :liked_comments, through: :likes, source: :post # userがどの投稿をいいねしているのかを取得
  has_many :teams, through: :team_members
  has_many :events
  has_many :applicants, dependent: :destroy
  has_many :rooms
  has_many :messages

  validates :name, presence: true

  enum sex: { 男性: 1, 女性: 2 }

  # いいねを既にしているかの確認
  def already_liked?(comment)
    likes.exists?(comment_id: comment.id)
  end

  protected
  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)

    unless user
      user = User.create(name:     auth.info.name,
                         email: auth.info.email,
                         provider: auth.provider,
                         uid:      auth.uid,
                         token:    auth.credentials.token,
                         password: Devise.friendly_token[0, 20],
                         meta:     auth.to_yaml)
    end
    user
  end
end
