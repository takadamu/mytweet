class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments

  def self.search(search)
    return Tweet.all unless search
    Tweet.where('text LIKE(?)', "%#{search}%")
  end

  # 上の書き方が分かりにくい場合は下記
  # def self.search(search)
  #   if search
  #     Tweet.where('text LIKR(?)', "%#{search}")
  #   else
  #     Tweet.all
  #   end
  # end

end
