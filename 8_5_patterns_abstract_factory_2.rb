# Dynamic abstract factory, with calculated class name. To add a new reader,
# just create the class -- no need to modify the factory. Convention over
# configuration!

require 'uri'
class HttpReader;end
class FileReader;end
class FtpReader;end

class ReaderFactory
  def self.reader uri
    scheme = URI.parse(uri).scheme
    const_get(scheme.capitalize + 'Reader').new
  end
end

begin
  puts ReaderFactory.reader('http://google.com').class
  puts ReaderFactory.reader('file://readme.txt').class
  puts ReaderFactory.reader('ftp://example.com/file').class
  puts ReaderFactory.reader('gopher://example.com/file').class
rescue Exception => e
  p e
end

puts "Now create a gopher reader..."
class GopherReader;end
puts ReaderFactory.reader('gopher://example.com/file').class

# Remove the GopherReader class so we can run the example more than once
# in the same ruby instance
self.class.send :remove_const, "GopherReader"
