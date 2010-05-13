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
