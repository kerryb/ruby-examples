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

puts ReaderFactory.reader('http://google.com').class
puts ReaderFactory.reader('file://readme.txt').class
puts ReaderFactory.reader('ftp://example.com/file').class
puts ReaderFactory.reader('gopher://example.com/file').class
