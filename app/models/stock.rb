class Stock < ApplicationRecord
    def self.new_lookup(ticker_symbol)
        api_key = Rails.application.credentials.fmp[:api_key]
        uriString = "https://financialmodelingprep.com/api/v3/quote/#{ticker_symbol}?apikey=#{api_key}" 
        uri = URI(uriString)
        res = Net::HTTP.get(uri)
        stock = JSON.parse(res) 
        stock[0]['price']
    end
end
