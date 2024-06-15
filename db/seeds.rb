# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: '1@1',
    password: '111111'
)

Customer.create!(
    email: '1@1',
    password: '111111',
    last_name: '日本',
    first_name: '太郎',
    last_name_kana: 'ニホン',
    first_name_kana: 'タロウ',
    postal_code: '1',
    address: '1',
    telephone_number: '1'
    )