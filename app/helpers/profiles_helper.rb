module ProfilesHelper
  def userpic_for(user, options = { size: 80})
    if !user.profile.nil?
      if user.profile.use_gravatar?
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt: user.profile.nickname, class: "gravatar img-rounded")
      else
        size = options[:size]
        image_tag(user.profile.userpic.url(:normal), alt: user.profile.nickname, height: size, width: size, class: "gravatar img-rounded img-responsive")
      end
    end

  end

  def nickname_for(user)
    if !user.profile.nil?
      user.profile.nickname
    else
      "Unnamed"
    end
  end
end
