class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :rememberable, :trackable
  has_and_belongs_to_many :plans
  belongs_to :profile

  def kanji?(plan)
    id == plan.user_id
  end

  def join?(plan)
    plan.users.include?(self)
  end

end
