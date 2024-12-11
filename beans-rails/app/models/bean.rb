# app/models/bean.rb
require 'httparty'

class Bean
  include HTTParty
  base_uri 'https://wiv8r6ok13.execute-api.us-east-1.amazonaws.com/prod'
  
  def self.all
    begin
      response = HTTParty.get("#{base_uri}/bean_products")
      
      if response.success?
        JSON.parse(response.body)
      else
        Rails.logger.error("API request failed with status #{response.code}: #{response.body}")
        []
      end
      
    rescue HTTParty::Error => e
      Rails.logger.error("HTTParty error: #{e.message}")
      []
    rescue StandardError => e
      Rails.logger.error("Error fetching beans: #{e.message}")
      []
    end
  end
end