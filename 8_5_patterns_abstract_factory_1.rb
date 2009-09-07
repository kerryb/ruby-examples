class HttpReader;end
class FileReader;end
class FtpReader;end

class ReaderFactory
  def self.reader uri
    case uri
    when /^http:/ then HttpReader.new
    when /^file:/ then FileReader.new
    when /^ftp:/ then FtpReader.new
    else
      raise "No reader available for #{uri}"
    end
  end
end

puts ReaderFactory.reader('http://google.com').class
puts ReaderFactory.reader('file://readme.txt').class
puts ReaderFactory.reader('ftp://example.com/file').class
puts ReaderFactory.reader('gopher://example.com/file').class
