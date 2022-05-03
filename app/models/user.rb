class User < ApplicationRecord
  has_many :posts
  User.count
  
  validates :title,presence: true
  validates :startDate, presence: true
  validates :endDate, presence: true
  validate :startDate_endDate_check
  validate :start_end_check
  validates :memo, length: { minimum: 0, maximum:100}
  
  def startDate_endDate_check
    errors.add(:endDate,"の日付を正しく入力してください")if
    startDate.nil? || self.startDate > self.endDate 
  end
  def start_end_check
    errors.add(:endDate,"は今日以降の日付を入力してください")if
    endDate.nil? ||self.endDate < Date.today
  end
  end


