class Picture < ActiveRecord::Base

  validates :title, uniqueness: true, presence: true

  scope :newest_first, -> { order('created_at DESC') }
  scope :most_recent_five, -> { newest_first.limit(5) }
  scope :created_before, ->(time) { where("created_at < ?", time) }

  def self.created_before(time)
    where("created_at > ?", time) 
  end

end