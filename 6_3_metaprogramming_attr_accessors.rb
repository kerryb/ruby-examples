# Creating a class method which allows declaritive creation of getter and
# setter methods. In real life, of course, you would use the built-in
# attr_accessor, and have accessors foo and foo=, not get_foo and set_foo.
#
# Note how we mix the module into Object, so our access_attributes method
# is available to any class. Use this technique sparingly!

module AccessAttributes
  def access_attributes *names
    names.each do |name|
      class_eval <<-"EOF"
        def get_#{name}
          @#{name}
        end

        def set_#{name} value
          @#{name} = value
        end
      EOF
    end
  end
end

Object.send :include, AccessAttributes

class Bar
  access_attributes :foo

  def initialize foo
    @foo = foo
  end
end

bar = Bar.new 'hello'

puts bar.get_foo

bar.set_foo 'goodbye'
puts bar.get_foo
