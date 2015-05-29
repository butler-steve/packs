class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :packs, class_name: 'Pack', foreign_key: 'user_id', dependent: :destroy

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

end
