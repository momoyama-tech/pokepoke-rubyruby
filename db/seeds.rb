# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


unless User.exists?(email_address: 'foo@example.com')
  puts("add users")
  User.create!(email_address: "foo@example.com", password: "password")
  User.create!(email_address: "bar@example.com", password: "password")
  User.create!(email_address: "baz@example.com", password: "password")
end

puts("add cards")
[ {
  name: "Card 1",
  img_url: 'https://img.game8.jp/10818521/90e368c73c2b107dcd48d2d68ff5d7a1.png/show'
}, {
  name: "Card 2",
  img_url: 'https://img.game8.jp/10818521/90e368c73c2b107dcd48d2d68ff5d7a1.png/show'
}, {
  name: "Card 3",
  img_url: 'https://img.game8.jp/10818521/90e368c73c2b107dcd48d2d68ff5d7a1.png/show'
}, {
  name: "Card 4",
  img_url: 'https://img.game8.jp/10818521/90e368c73c2b107dcd48d2d68ff5d7a1.png/show'
}, {
  name: "Card 5",
  img_url: 'https://img.game8.jp/10818521/90e368c73c2b107dcd48d2d68ff5d7a1.png/show'
}, {
  name: "Card 6",
  img_url: 'https://img.game8.jp/10818521/90e368c73c2b107dcd48d2d68ff5d7a1.png/show'
}, {
  name: "Card 7",
  img_url: 'https://img.game8.jp/10818521/90e368c73c2b107dcd48d2d68ff5d7a1.png/show'
}, {
  name: "Card 8",
  img_url: 'https://img.game8.jp/10818521/90e368c73c2b107dcd48d2d68ff5d7a1.png/show'
}, {
  name: "Card 9",
  img_url: 'https://img.game8.jp/10818521/90e368c73c2b107dcd48d2d68ff5d7a1.png/show'
}, {
  name: "Card 10",
  img_url: 'https://img.game8.jp/10818521/90e368c73c2b107dcd48d2d68ff5d7a1.png/show'
} ].each do |poke_card|
  PokeCard.find_or_create_by(poke_card)
end

puts("add deck recipes")
[ {
  name: "Deck 1",
  user_id: User.first.id
}, {
  name: "Deck 2",
  user_id: User.second.id
}, {
  name: "Deck 3",
  user_id: User.third.id
}, {
  name: "Deck 4",
  user_id: User.first.id
} ].each do |deck_recipe|
  DeckRecipe.find_or_create_by(deck_recipe)
end

puts("add deck recipes_poke_cards")
DeckRecipe.all.each do |deck_recipe|
  PokeCard.all.sample(20).each do |poke_card|
    DeckRecipesPokeCard.find_or_create_by(deck_recipe_id: deck_recipe.id, poke_card_id: poke_card.id)
  end
end

puts("add match results")
100.times do
  user, target_user = User.all.sample(3)
  match_result = MatchResult.create!(
    user_id: user.id,
    target_user_id: target_user.id,
    result: [ 0, 5, 10 ].sample
  )
  ea = 1 / (1 + 10 ** ((target_user.rate_point - user.rate_point) / 400))
  k = 20
  user.update(rate_point: user.rate_point + k * (match_result.result - ea))
end
