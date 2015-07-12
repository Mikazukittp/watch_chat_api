# android用の記述
Rpush::Gcm::App.seed do |s|
  s.name = "android_app"
  s.auth_key = "AIzaSyArjiD7tb5XDwXIdh2t6ugQNZx4KQzqwYM"
  s.connections = 1
end

# ios用の記述
Rpush::Apns::App.seed do |s|
  s.name = "ios_app"
  s.certificate = File.read(Rails.root.join('certificates', 'apns', "sandbox.pem"))
  s.environment = "sandbox"
  s.password = "certificate password"
  s.auth_key = "fugahoge"
  s.connections = 1
end
