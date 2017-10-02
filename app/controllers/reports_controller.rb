class ReportsController < ApplicationController
  def cache
    markets = Market.all.map(&:name)
    @cache_values = []

    markets.each do |market|
      if market.include?('BTC')
        prices = CACHE.get(market)
        if prices.present? && (prices.last != prices.last(2).first)
          @cache_values << "#{market} - #{prices.last}"
        end
      end
    end

    @title = 'CACHE'

    respond_to do |format|
      format.pdf do
        render pdf: @title, template: 'reports/cache.slim'
      end
    end
  end
end