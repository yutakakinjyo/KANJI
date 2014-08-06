require 'digest/md5'

class Gravatar

  def initialize(email)
    @email_hash = Digest::MD5.hexdigest(email.downcase)
  end

  def image_url
    "http://www.gravatar.com/avatar/#{@email_hash}"
  end

end
