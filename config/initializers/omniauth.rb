Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "507107589293-f4s6ub488145v471ngkhkdavim99fpb6.apps.googleusercontent.com", "AwZqhS8QTXFGs0JMSm72kPQw"
  provider :facebook, '280479902563756', '39e3744fdf98470514bff0507d945af1', scope: 'email, public_profile', info_fields: 'email, first_name, last_name'
  # provider :facebook, '280479902563756', '39e3744fdf98470514bff0507d945af1', scope: 'email, public_profile, user_location, user_status', info_fields: 'email, first_name, last_name, picture'
  #, :provider_ignores_state => true
end

# rails s -b 'ssl://site.com:3000?key=path/to/file/example.key&cert=path/to/file/example.crt'
# openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout example.key -out example.crt -subj "/CN=site.com" -days 365

# rails s -b 'ssl://localhost:3000?key=path/to/file/localhost.key&cert=path/to/file/localhost.crt'
# openssl req -x509 -newkey rsa:2048 -sha256 -nodes -keyout localhost.key -out localhost.crt -days 365

# https://1d67a25b.ngrok.io/users/auth/facebook