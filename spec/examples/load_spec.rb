require File.dirname(__FILE__) + '/spec_helper'

describe Sailthru::Client do

  it 'should be able to load (ruby 1.9.2)' do
    lambda do
      Sailthru::Client.new
    end.should_not raise_error
  end

end
