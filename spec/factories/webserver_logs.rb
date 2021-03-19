require_relative '../spec_helper'
require_relative '../../config'
require_relative "#{ROOT_PATH}/lib/webserver_log"
require 'faker'
FactoryBot.define do
  factory :webserver_log do
    url { Faker::Internet.domain_name }
    ip { Faker::Internet.public_ip_v4_address }
    skip_create
    initialize_with { new(attributes) }
  end
end
