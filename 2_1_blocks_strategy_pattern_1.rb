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
