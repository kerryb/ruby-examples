require 'builder'

xml = Builder::XmlMarkup.new :target => $stdout, :indent => 2

xml.widgets do
  (1..3).each do |n|
    xml.widget do
      xml.name "Widget number #{n}"
      xml.serial_number :value => n
    end
  end
end
