namespace :monitor do

  desc 'Monitor markets'
  task :markets => :environment do

    #============= CACHE POPULATION ====================
    result = MarketService::Monitor.new.fire!

    markets = result[:markets]
    percentile_volume = result[:percentile_volume]
    Rails.logger.info "Percentile Volume: #{percentile_volume}"
    start_to_trade = result[:cache_population_finished]

    Rails.logger.info " #{result[:cache_population_finished]}"

  end
end
