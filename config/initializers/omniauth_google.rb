Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Figaro.env.google_id, Figaro.env.google_secret
  {
    name: 'google',
    scope: 'email, profile',
    prompt: 'select_account',
    image_aspect_ratio: 'square',
    image_size: '300'
  }
end
