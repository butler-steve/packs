class Item < ActiveRecord::Base
  belongs_to :pack

  validates_presence_of :content, :on => :create
  validates_presence_of :weight, :on => :create
  validates_uniqueness_of :content

  after_initialize :init

  private

  def init
    if self.new_record? && self.weight.nil?
      self.weight = 5
    end
  end

end
