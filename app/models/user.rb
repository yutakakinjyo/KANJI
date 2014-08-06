class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :rememberable, :trackable
  has_and_belongs_to_many :plans
  has_one :profile

  def kanji?(plan)
    id == plan.user_id
  end

  def join?(plan)
    plan.users.include?(self)
  end

  def name
    profile.nil? ? login : profile.name
  end

  def avatar_large
    "#{gravatar}?s=100"
  end

  def avatar_medium
    "#{gravatar}?s=50"
  end

  def avatar_small
    "#{gravatar}?s=30"
  end


  private
    def gravatar
      Gravatar.new(profile.mail).image_url
    end

end
