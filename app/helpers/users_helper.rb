module UsersHelper

  def user_avatar(user, width = '', height = '')
    if user.avatar.attached?
      image_tag(url_for(user.avatar), width: width, height: height)
    else
      image_tag('missing.jpg', width: width, height: height)
    end
  end
end
