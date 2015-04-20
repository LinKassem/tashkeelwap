module ApplicationHelper

	def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?d=retro&s=100"
  end

	def small_avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?d=retro&s=50"
  end

	def resource_name
    :player
  end
 
  def resource
    @resource ||= Player.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:player]
  end
  
end