require 'rufus-scheduler'
require 'rake'

Rails.application.load_tasks

start = Rufus::Scheduler.singleton
start_monitor = Rufus::Scheduler.singleton
monitor = Rufus::Scheduler.singleton

unless defined?(Rails::Console)

  start.in '1s' do
    CACHE.flush_all
    puts "====================== DESTRUYO ========================="
    Orderr.destroy_all
    Wallet.destroy_all
    Transactionn.destroy_all
    Test.destroy_all
    Account.destroy_all

    Rake::Task['destroy:markets'].execute
    Rake::Task['populate:markets'].execute

    #TODO: Select proper a
    # ccount
    #Rake::Task['populate:wallets'].invoke(1)
  end

  start_monitor.in '60s' do
    monitor.every "#{PERIOD_SEG}s" do
      Rake::Task['monitor:markets'].reenable
      Rake::Task['monitor:markets'].invoke
    end
  end
end


