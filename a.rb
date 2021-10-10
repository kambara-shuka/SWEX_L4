require 'bcrypt'
signup_password = BCrypt::Password.create("bbb")
puts signup_password
login_password = BCrypt::Password.new(signup_password)
puts login_password
if login_password == "sanriko" #←login_password.==("my password")
    p "ログイン成功"
end