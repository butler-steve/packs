class Pack < ActiveRecord::Base
  belongs_to :user
  has_many :items

  validates_presence_of :name, :on => :create
  validates_uniqueness_of :name

  after_initialize :init

  private

  def init
    if self.new_record? && self.expiration_interval.nil?
      self.expiration_interval = 10
    end
    if self.new_record? && self.sched_algo.nil?
      self.sched_algo = "oldest_by_weight"
    end
  end
end
