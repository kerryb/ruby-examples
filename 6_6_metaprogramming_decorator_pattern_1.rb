class Logger
  def log message
    puts message
  end
end

simple_logger = Logger.new
simple_logger.log 'Simple logger'

class TimestampLogger
  def initialize(logger)
    @logger = logger
  end

  def log message
    @logger.log "#{Time.now}: #{message}"
  end
end

timestamp_logger = TimestampLogger.new(simple_logger)
timestamp_logger.log 'Timestamp logger'

class PidLogger
  def initialize(logger)
    @logger = logger
  end

  def log message
    @logger.log "[#{$$}] #{message}"
  end
end

pid_timestamped_logger = PidLogger.new(timestamp_logger)
pid_timestamped_logger.log 'PID & timestamp logger'
