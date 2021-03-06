# usage_api_ruby_client

+ [Introduction](#introduction)
+ [Features](#features)
+ [Getting Started](#getting-started)
+ [Use Cases](#use-cases)
+ [Todo Items](#todo-items)

## Introduction <a id="introduction" class="tall">&nbsp;</a>

This Ruby client exercises Gnip's Usage API 2.0.

Here are the API defaults.

## Features <a id="features" class="tall">&nbsp;</a>

List cool things client does.

## Getting Started <a id="getting-started" class="tall">&nbsp;</a>

Clone the repo and enter your account details in the config file.

## Use Cases <a id="use-cases" class="tall"></a>

Below are the use cases currently supported by this client:

Default use case: Write full response to a file in 'outbox'

1. Create file with summary level (non-JSON formatted) data written a file in outbox (.txt, .csv)
2. Get usage details by product and endpoint (PowerTrack by publisher, 30-Day Search, FAS, HPT)
3. Something around HPT days/jobs for a specific month
4. Percent of used data compared to contracted amount
5. Usage threshold alert

## Todo Items <a id="todo-items" class="tall"></a>

1. ~~Wire up client to successfully make a call to Usage API (load config, structure faraday request, make API call)~~
2. ~~Options: Use optparser to take in the available API options directly through command line~~
3. ~~Load API response into ruby hash to be able to easily retrieve specific fields of the response~~
4. ~~Develop use case (default) Write full response to a file in 'Outbox'~~
5. Develop use case (1) - summary level data written to a file
6. Jim to add his ruby applogger code 

