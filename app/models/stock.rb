class Stock < ApplicationRecord
    has_many :user_stocks
    has_many :users, through: :user_stocks
    
    validates :name, :ticker, presence: true
    
    def self.new_lookup(ticker_symbol)
        api_key = Rails.application.credentials.fmp[:api_key]
        uriString = "https://financialmodelingprep.com/api/v3/quote/#{ticker_symbol}?apikey=#{api_key}" 
        uri = URI(uriString)
        res = Net::HTTP.get(uri)
        stock = JSON.parse(res) 
        begin 
            new(ticker: ticker_symbol, name: stock[0]['name'], last_price: stock[0]['price'])
        rescue => exception
            return nil 
        end
    end
    
    def self.check_db(ticker_symbol)
       where(ticker: ticker_symbol).first 
    end
end
