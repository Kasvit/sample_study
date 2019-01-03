class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2, :facebook]
  
  has_one_attached :avatar, dependent: :destroy
  has_many :messages

  # after_save    :expire_user_all_cache
  # after_destroy :expire_user_all_cache
  after_commit  :flush_cache

  # validate :low_rating_ignore
  # validate :check_first_name
  validates :avatar, content_type: ['image/png', 'image/jpg', 'image/jpeg'] 

  def full_name
    "#{first_name} #{last_name}"
    # return email.split('@')[0].capitalize
  end

  def self.from_omniauth(auth)
    result = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      if auth.provider == 'facebook'
        attach_facebook_fields(user, auth)
      end
      if auth.provider == 'google_oauth2'
        user.first_name    = auth.info.first_name 
        user.last_name     = auth.info.last_name
      end
      user.email         = auth.info.email
      # binding.pry
      # user.token         = auth.credentials.token
      user.provider = auth.provider
      user.uid = auth.uid
      # user.expires       = auth.credentials.expires
      # user.expires_at    = auth.credentials.expires_at
      # user.refresh_token = auth.credentials.refresh_token
      user.password      = user.password_confirmation = Devise.friendly_token[0,20]
    end

    if result.persisted?
      downloaded_image   = open(auth.info.image)
      result.avatar.attach(io: downloaded_image, filename: 'avatar.jpg', content_type: downloaded_image.content_type)
      result.save
    end
    result
  end

  # def self.all_cached
  #   Rails.cache.fetch('User.all') { all.to_a }
  #   # Rails.cache.fetch('User.all', expires_in: 5.seconds) { all.to_a }
  # end

  private

  # def expire_user_all_cache
  #   Rails.cache.delete('User.all')
  # end
  def flush_cache
    Rails.cache.delete([self.class.name, id])
  end

  def self.attach_facebook_fields(user, auth)
    user.first_name    = auth.info.first_name
    user.last_name     = auth.info.last_name   
  end

  # def self.random_password
  #   o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
  #   string = (0...15).map { o[rand(o.length)] }.join    
  # end

    # def low_rating_ignore
    #   if self.rating < 5
    #     errors.add(:rating, "Cant be less than 5")
    #   end
    # end

    # def check_first_name
    #   if self.first_name == "Igor"
    #     errors.add(:first_name, "can`t be Igor")
    #   end
    # end
end
