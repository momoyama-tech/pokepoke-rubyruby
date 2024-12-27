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
      card_data.push([ data["title"], data["image_url"] ])
    end
    card_data.compact!
    puts "card_data: #{card_data}"
    puts "card_data.length: #{card_data.length}"
    binding.b
  end
end
