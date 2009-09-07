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

simple_logger = Logger.new
simple_logger.log 'Simple logger'

exit

class Logger
  def log message
    puts message
  end
end

module TimestampDecorator
  def self.included cls
    cls.class_eval <<-"EOF"
      alias_method :log_without_timestamp, :log
      def log_with_timestamp message
        log_without_timestamp "\#{Time.now}: \#{message}"
      end
      alias_method :log, :log_with_timestamp
    EOF
  end
end
Logger.send :include, TimestampDecorator

timestamp_logger = Logger.new
timestamp_logger.log 'Timestamp logger'

module PidDecorator
  def self.included cls
    cls.class_eval <<-"EOF"
      alias_method :log_without_pid, :log
      def log_with_pid message
        log_without_pid "[\#{$$}] \#{message}"
      end
      alias_method :log, :log_with_pid
    EOF
  end
end
Logger.send :include, PidDecorator

pid_timestamped_logger = Logger.new
pid_timestamped_logger.log 'PID & timestamp logger'

