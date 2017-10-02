namespace :monitor do

  desc 'Monitor markets'
  task :markets => :environment do

    #============= CACHE POPULATION ====================
    result = MarketService::Monitor.new.fire!

    CACHE.set('markets', result[:markets])
    CACHE.set('percentile_volume', result[:percentile_volume])
    #Rails.logger.info "Percentile Volume: #{percentile_volume}"
    CACHE.set('start_to_trade', result[:cache_population_finished])

    #Rails.logger.info " #{result[:cache_population_finished]}"
  end
end
