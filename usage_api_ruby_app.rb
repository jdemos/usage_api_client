require 'json'
require 'optparse'
require 'yaml'

# Call class
require_relative './lib/get_usage'

if __FILE__ == $0 # This script code is executed when running this file.

  # Option Parser
  cli_options = {}

  parser = OptionParser.new do |opts|
    opts.on('-a', '--accountdetails', 'accountDetails - specify yml file path and name') do |a|
      cli_options[:accountdetails] = a;
    end
    opts.on('-b', '--bucket', 'Bucket (month or day)') do |b|
      cli_options[:bucket] = b;
    end
    opts.on('-t', '--todate', 'toDate - is exclusive and UTC time (YYYYMMDDHHMM)') do |t|
      cli_options[:todate] = t;
    end
    opts.on('-f', '--fromdate', 'fromDate - is inclusive and UTC time (YYYYMMDDHHMM)') do |f|
      cli_options[:fromdate] = f;
    end
  end

  parser.parse!

  # Set default location of config accounts file
  if cli_options[:accountdetails].nil?
    cli_options[:accountdetails] = "config/accounts.yml"
  end

  client = GetUsage.new()
    # Load cli options from accounts.yml
    client.load_account_details(cli_options[:accountdetails])

    response = client.build_request

    puts response
end

# - WRITE DATA TO FILE

# # create timestamp for file naming
# time = Time.new
# timestamp = time.hour.to_s + "_" + time.min.to_s + "_" + time.sec.to_s
