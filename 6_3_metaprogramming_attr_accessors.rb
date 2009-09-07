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
