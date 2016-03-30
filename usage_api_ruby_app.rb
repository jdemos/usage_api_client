require 'optparse'


if __FILE__ ==$0 # This script code is executed when running this file.

# Option Parser
options = {}

parser = OptionParser.new do |opts|
  opts.on('-b', '--bucket', 'Bucket') do |b|
    options[:bucket] = b;
  end
  opts.on('-t', '--todate', 'toDate') do |t|
    options[:todate] = t;
  end
  opts.on('-f', '--fromdate', 'fromDate') do |f|
    options[:fromdate] = f;
  end
end

parser.parse!

# - WRITE DATA TO FILE

# create timestamp for file naming
time = Time.new
timestamp = time.hour.to_s + "_" + time.min.to_s + "_" + time.sec.to_s