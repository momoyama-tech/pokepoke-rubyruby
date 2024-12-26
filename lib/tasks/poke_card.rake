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
      card_image_tags = driver.find_elements(:class, "pokemon-card-search__card-image")
      puts "card_image_tags.length"
      puts card_image_tags.length
      # 画像のURLを取得する処理
      for card_image_tag in card_image_tags do
        card_urls.push(card_image_tag.attribute("src"))
      end
      # URL取得状況の確認
      puts "card_urls.length: #{card_urls.length}"
      puts "card_urls[0]: #{card_urls[0]}"
      puts "card_urls[299]: #{card_urls[299]}"
      # 2ページ目以降のURLを取得する処理
      pagination_buttons = driver.find_elements(:class, "pokemon-card-search__pagination-btn")
      puts "pagination_buttons.length: #{pagination_buttons.length}"
      if pagination_buttons.length > 0
        puts "if文突入"
        puts "pagination_buttons: #{pagination_buttons}"
        puts "pagination_buttons.inspect: #{pagination_buttons.inspect}"
        puts "pagination_buttons[3]: #{pagination_buttons[3].inspect}"
        puts "pagination_buttons[3].displayed?: #{pagination_buttons[3].displayed?}"
        puts "pagination_buttons[3].enabled?: #{pagination_buttons[3].enabled?}"
        puts "クリック前"
        wait.until { pagination_buttons[3].enabled? && pagination_buttons[3].displayed? }
        # driver.action.move_to(pagination_buttons[3]).click.perform
        second_page_button = pagination_buttons.find { |button| button.text == "次へ" }
        driver.action.move_to(second_page_button).click.perform
        # driver.action.move_to(pagination_buttons[3], 1, 1).click().perform
        # wait = Selenium::WebDriver::Wait.new(timeout: @wait_time)
        # 直接クリックする
        # pagination_buttons[3].click
        # JavaScriptでクリックする
        # second_page_button = driver.find_element(:class, "pokemon-card-search__pagination-btn")[3]
        # driver.execute_script("arguments[0].click();", second_page_button)
        puts "クリック後"
        puts "ボタンclick完了"
        # ページ遷移を待機（例：特定の要素が表示されるまで待つ）
        wait.until { driver.find_elements(:class, "pokemon-card-search__card-image").length > 1 }
        puts "ページ遷移完了を待機"
        card_image_tags = driver.find_elements(:class, "pokemon-card-search__card-image")
        puts "card_image_tags.length: #{card_image_tags.length}"
        for card_image_tag in card_image_tags do
          card_urls.push(card_image_tag.attribute("src"))
        end
        puts "card_urls.length: #{card_urls.length}"
        puts "card_urls[0]: #{card_urls[0]}"
        puts "card_urls[300]: #{card_urls[300]}"
        puts "card_urls[299]: #{card_urls[299]}"
        puts "card_urls[599]: #{card_urls[599]}"
      end
      binding.break
    rescue
      driver.quit
    end
  end
end
