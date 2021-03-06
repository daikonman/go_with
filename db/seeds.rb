# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

# 追加のユーザーをまとめて生成する
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  amount = rand(2..10)
  s1 = Date.parse("2021/01/1")
  s2 = Date.parse("2021/12/31")
  departure = Random.rand(s1 .. s2)
  back = departure + rand(1..5)
  users.each { |user| user.microposts.create!(content: content,
                                              amount: amount,
                                              departure: departure,
                                              back: back) }
end