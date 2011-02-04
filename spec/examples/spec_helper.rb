require 'yaml'
require 'sailthru/client'

module Rails
  def self.root
    File.dirname(__FILE__) + '/../support'
  end
end
