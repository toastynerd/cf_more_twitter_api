require 'resque/tasks'
require 'resque_scheduler/tasks'

namespace :resque do
  task :setup => :environment do
    require 'resque'
    require 'resque_scheduler'
    require 'resque/scheduler'

    Resque.redis = ENV["REDIS_SERVER"]

    Resque::Scheduler.dynamic = true

    # Resque.schedule = YAML.load_file("#{Rails.root}/config/resque_schedule.yml")

    require 'send_to_twitter'
    require 'twitter'

  end
end
