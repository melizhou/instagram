Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['991525517558519'], ENV['e1c90224bd3e4ba645ce50e168709949"'],
           :scope => 'email', :display => 'popup'
end