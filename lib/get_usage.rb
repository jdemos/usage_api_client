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

  def response_to_json(@response)
    return JSON.parse(response.body)
  end

  # convert response to JSON
  def pretty_print_response(response)
    response_json = JSON.parse(response.body)
    return JSON.pretty_generate(response_json)
  end

  # write full response to a file
  def create_results_file(response_pp)
    response_pp = JSON.pretty_generate(response_pp)
    file = File.open("./outbox/results_#{get_timestamp}.json", "w")
    file.write "Below are the Usage results in JSON format: \n" +  "#{response_pp}"
    file.close
  end

  # write summary file - JSON converted to readable text
  def create_summary_file(response_json)

  end

end