class Logger
  def log message
    puts message
  end
end

simple_logger = Logger.new
simple_logger.log 'Simple logger'

module TimestampDecorator
  def log_with_timestamp message
    log_without_timestamp "#{Time.now}: #{message}"
  end

  def self.included base
    base.class_eval do
      alias_method :log_without_timestamp, :log
      alias_method :log, :log_with_timestamp
    end
  end
end
Logger.send :include, TimestampDecorator

timestamp_logger = Logger.new
timestamp_logger.log 'Timestamp logger'

module PidDecorator
  def log_with_pid message
    log_without_pid "[#{$$}] #{message}"
  end

  def self.included base
    base.class_eval do
      alias_method :log_without_pid, :log
      alias_method :log, :log_with_pid
    end
  end
end
Logger.send :include, PidDecorator

pid_timestamped_logger = Logger.new
pid_timestamped_logger.log 'PID & timestamp logger'

