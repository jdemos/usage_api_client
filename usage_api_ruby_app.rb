require 'json'
require 'optparse'
require 'yaml'

# Call class
require_relative './lib/get_usage'

if __FILE__ == $0 # This script code is executed when running this file.

  # Option Parser
  cli_options = {}

  parser = OptionParser.new do |opts|
    opts.on('-a ACCOUNT', '--accountdetails', 'accountDetails - specify yml file path and name') do |a|
      cli_options[:accountdetails] = a;
    end
    opts.on('-b BUCKET', '--bucket', 'Bucket (month or day)') do |b|
      cli_options[:bucket] = b;
    end
    opts.on('-t TODATE', '--todate', 'toDate - is exclusive and UTC time (YYYYMMDDHHMM)') do |t|
      cli_options[:todate] = t;
    end
    opts.on('-f FROMDATE', '--fromdate', 'fromDate - is inclusive and UTC time (YYYYMMDDHHMM)') do |f|
      cli_options[:fromdate] = f;
    end
    opts.on('-p PRODUCT', '--product', 'product - specify which API (e.g. PowerTrack, Search API, etc.)') do |p|
      cli_options[:product] = p;
    end
    opts.on('-s SOURCE', '--source', 'source - specify the source/publisher (e.g. Auttomattic, Twitter, etc.)') do |s|
      cli_options[:source] = s;
    end
    opts.on('-o OUTBOX', '--outbox', 'outbox - specify the path where you want the results to go') do |o|
      cli_options[:outbox] = o;
    end
  end

  parser.parse!


  # Set default location of config accounts file
  if cli_options[:accountdetails].nil?
    cli_options[:accountdetails] = "./config/accounts.yml"
  end

  client = GetUsage.new()
    # Load cli options from accounts.yml
    client.load_account_details(cli_options[:accountdetails])

    response = client.build_request

    response = client.pretty_print_response(response)

    client.create_results_file(response)

end