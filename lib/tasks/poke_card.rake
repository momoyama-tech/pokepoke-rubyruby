namespace :poke_card do
  task run: :environment do
    require "net/http"
    uri = URI.parse("https://assets.game8.jp/tools/script_template/pokemon_card.json?version=28")
    request = Net::HTTP::Get.new(uri)
    req_options = {
      use_ssl: uri.scheme == "https"
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    require "nokogiri"
    doc = Nokogiri::HTML.parse(response.body, nil, "utf-8")
    p doc
    json = JSON.parse(doc.text)
    p json
    db_data = json[0]["db_data"]
    puts db_data
    card_data = Array.new(2) { }
    for data in db_data
      card_data.push([ data["title"], data["image_url"], data["col_8"], data["col_7"], data["col_9"], data["col_10"], data["col_13"], data["col_14"], data["col_15"] ])
    end
    card_data.compact!
    puts "card_data: #{card_data}"
    puts "card_data.length: #{card_data.length}"
    for data in card_data
      PokeCard.create(name: data[0], img_url: data[1], hp: data[2].to_i, evolution_level: data[3], pokemon_type: data[4], weakness: data[5], basic_evolution: data[6], first_evolution: data[7], second_evolution: data[8])
    end
    binding.b
  end
end
