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
    card_urls = []
    for data in db_data
      url = data["image_url"]
      card_urls.push(url)
    end
    puts "card_urls: #{card_urls}"
    puts "card_urls.length: #{card_urls.length}"
    for i in 0..card_urls.length-1
      puts "card_urls[#{i}]: #{card_urls[i]}"
    end
    binding.b
  end
end
