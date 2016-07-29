require 'redis'

module ReadCache
  class << self
    def redis
      @redis ||= Redis.new(Rails.application.config_for('cable'))
    end
  end
end
