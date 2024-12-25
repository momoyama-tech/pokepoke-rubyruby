namespace :poke_card do
  task run: :environment do
    require "selenium-webdriver"
    @wait_time = 10
    @timeout = 180
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument("--headless")
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")
    options.add_argument("--window-size=1280x800")
    ua = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36"
    options.add_argument("--user-agent=#{ua}")
    card_urls = []
    begin
      # もし途中で止まったらdockerを再起動してください
      driver = Selenium::WebDriver.for :remote, url: "http://selenium:4444", options: options
      driver.manage.timeouts.implicit_wait = @timeout
      wait = Selenium::WebDriver::Wait.new(timeout: @wait_time)
      driver.navigate.to("https://game8.jp/pokemon-tcg-pocket/639698")
      puts driver.title
      card_imgae_tags = driver.find_elements(:class, "pokemon-card-search__card-image")
      puts "card_imgae_tags.length"
      puts card_imgae_tags.length
      # 画像のURLを取得する処理
      for card_image_tag in card_imgae_tags do
        card_urls.push(card_image_tag.attribute("src"))
      end
      # URL取得状況の確認
      puts "card_urls.length"
      puts card_urls.length
      puts "card_urls[0]"
      puts card_urls[0]
      puts "card_urls[299]"
      puts card_urls[299]
      binding.break
    rescue
      driver.quit
    end
  end
end
