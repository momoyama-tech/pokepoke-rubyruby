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
    begin
      # もし途中で止まったらdockerを再起動してください
      driver = Selenium::WebDriver.for :remote, url: "http://selenium:4444", options: options
      driver.manage.timeouts.implicit_wait = @timeout
      wait = Selenium::WebDriver::Wait.new(timeout: @wait_time)
      driver.navigate.to("https://www.google.com/")
      puts driver.title
      binding.break
    rescue
      driver.quit
    end
  end
end
