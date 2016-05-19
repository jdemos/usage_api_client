# API specific details
require 'faraday'

class GetUsage

  # Define attributes of GetUsage
  attr_accessor :options

  # load yml file
  def load_account_details(file_name)
    @options = YAML.load_file(file_name)
  end

  def build_request()
    # create variable to store the root URL
    request = Faraday.new(url: "https://gnip-api.twitter.com")
    request.basic_auth(@options['account']['user_name'], @options['account']['password'])
    response = request.get "/metrics/usage/accounts/#{@options['account']['account_name']}.json" # ?bucket=#{bucket}&fromdate=#{fromdate}&todate=#{todate}")
  end
end

# get usage metrics()
# print_summary()

# get metrics by product (product_name)