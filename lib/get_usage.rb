require 'faraday'

class GetUsage

  # used for file names below
  def get_timestamp()
    return Time.now.strftime('%Y-%m-%d_%H-%M-%S')
  end

  # Define attributes of GetUsage
  attr_accessor :options,
                :response  # either JSON or not

  # load yml file
  def load_account_details(file_name)
    @options = YAML.load_file(file_name)
  end

  # build API request
  def build_request()
    # create variable to store the root URL
    request = Faraday.new(url: "https://gnip-api.twitter.com")
    request.basic_auth(@options['account']['user_name'], @options['account']['password'])
    @response = request.get "/metrics/usage/accounts/#{@options['account']['account_name']}.json" # ?bucket=#{bucket}&fromdate=#{fromdate}&todate=#{todate}")
  end

 # parsed_response = JSON.parse(response.body)

  # convert response to JSON
  def pretty_print_response(response)
    response_json = JSON.parse(response.body)
    return JSON.pretty_generate(response_json)
  end

  # write full response to a file
  def create_results_file(response_json)
    # file = File.open("./outbox/results_#{get_timestamp}.json", "w")
    # file.write "Below are the Usage results in JSON format: \n" +  "#{response_json}"
    # file.close
    puts response_json
  end

  # write summary file - JSON converted to readable text
  def create_summary_file(response_json)
    file = File.open("./outbox/summary_#{get_timestamp}.txt", "w")
    file.write "Below is your Usage Summary: \n" + "#{response_json}"
    file.close
  end

end