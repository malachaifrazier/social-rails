Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Figaro.env.facebook_key, Figaro.env.facebook_secret,
           scope: 'email,public_profile',
           info_fields: 'name,first_name,last_name,email,about,gender',
           image_size: 'large'#,
           # client_options: {
           #  site: 'https://graph.facebook.com/v2.8',
           #  authorize_url: "https://www.facebook.com/v2.8/dialog/oauth"
           # }
end
