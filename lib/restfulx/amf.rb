$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))
$:.unshift "#{File.expand_path(File.dirname(__FILE__))}/amf/"

require 'amf/class_mapping'

module RestfulX::AMF
  
  ClassMapper = RestfulX::AMF::ClassMapping.new
  
  begin
    require 'amf/ext'
    puts "using native C AMF serializer"
  rescue LoadError
    require 'amf/pure'
    puts "using pure AMF serializer"
  end
      
  # The base exception for AMF errors.
  class AMFError < StandardError; end
end