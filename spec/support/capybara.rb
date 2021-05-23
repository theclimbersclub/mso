require "selenium/webdriver"

Capybara.default_max_wait_time = 10

Capybara.register_driver :chrome_headless do |app|
  chrome_capabilities = ::Selenium::WebDriver::Remote::Capabilities.chrome("goog:chromeOptions" => {args: %w[no-sandbox headless disable-gpu window-size=1400,1400]})

  if ENV["HUB_URL"]
    Capybara::Selenium::Driver.new(app,
      browser: :remote,
      url: ENV["HUB_URL"],
      desired_capabilities: chrome_capabilities)
  else
    Capybara::Selenium::Driver.new(app,
      browser: :chrome,
      desired_capabilities: chrome_capabilities)
  end
end

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    driven_by :chrome_headless

    Capybara.app_host = "http://#{IPSocket.getaddress(Socket.gethostname)}:4000"
    Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
    Capybara.server_port = 4000
  end
end
