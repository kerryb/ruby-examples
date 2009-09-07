class Context
  def initialize(strategy)
    @strategy = strategy
  end
 
  def execute
    raise 'Strategy object does not respond to the execute method' unless @strategy.respond_to?(:execute)
    @strategy.execute
  end
end

class StrategyA
  def execute
     puts 'Doing the task the normal way'
  end
end
 
class StrategyB
  def execute
     puts 'Doing the task alternatively'
  end
end
 
class StrategyC
  def execute
     puts 'Doing the task even more alternatively'
  end
end
 
a = Context.new(StrategyA.new)
a.execute
 
b = Context.new(StrategyB.new)
b.execute
 
c = Context.new(StrategyC.new)
c.execute

exit

class Context
  def initialize(strategy)
    @strategy = strategy
  end
 
  def execute
    @strategy.call
  end
end
 
strategy_a = Proc.new { puts 'Doing the task the normal way' }
strategy_b = Proc.new { puts 'Doing the task alternatively' }
strategy_c = Proc.new { puts 'Doing the task even more alternatively' }
 
a = Context.new(strategy_a)
a.execute
 
b = Context.new(strategy_b)
b.execute
 
c = Context.new(strategy_c)
c.execute
