module ProfilesHelper
  def gravatar_for(email, options = { size: 20 })
    if !email.nil?
      gravatar_id = Digest::MD5::hexdigest(email)
      size = options[:size]
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
      image_tag(gravatar_url, class: "gravatar img-rounded")
    else
      '<i class="glyphicon glyphicon-user" aria-hidden="true"></i>'.html_safe
    end
  end

  def userpic_for(user, options = { size: 80 })
    if !user.profile.nil?
      size = options[:size]
      if user.profile.use_gravatar?
        gravatar_for(user.email.downcase, size: size)
      else
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
