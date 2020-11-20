User.create(nickname:"admin",
            email: "admin@admin",
            password: "aaaaaaaa",
            first_name: "admin",
            last_name: "admin",
            first_name_kana: "アドミン",
            last_name_kana: "アドミン",
            birthday: "2020-01-01"
)

User.create(nickname:"hoge",
            email: "hoge@hoge",
            password: "aaaaaaaa",
            first_name: "hoge",
            last_name: "hoge",
            first_name_kana: "ホゲ",
            last_name_kana: "ホゲ",
            birthday: "2020-02-02"
)


Address.create(first_name: "hoge",
                last_name: "hoge1",
                first_name_kana: "ホゲ",
                last_name_kana: "ホゲ1",
                zip_code: "1111111",
                prefecture: "大阪府",
                city: "西区",
                town: "南堀江",
                number: "777",
                building: "ビル",
                telephone: "09011112222",
                user_id: "1"
)

Address.create(first_name: "huga",
  last_name: "huga",
  first_name_kana: "フガ",
  last_name_kana: "フガ1",
  zip_code: "2222222",
  prefecture: "京都府",
  city: "中京区",
  town: "河原町",
  number: "777",
  building: "ビル",
  telephone: "09033334444",
  user_id: "2"
)