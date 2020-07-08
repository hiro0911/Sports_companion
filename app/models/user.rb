class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :team_members, dependent: :destroy
  has_many :team_comments

  validates :name, presence: true

  enum sex: {男性:1, 女性:2}
end
