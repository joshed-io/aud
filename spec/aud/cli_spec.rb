require 'spec_helper'

require 'aud/cli'

describe Aud::CLI do
  it 'should have default options' do
    _, options = Aud::CLI.start(%w[listen -s test])
    options['octave'].should == 3
    options['note'].should == 'C'
    options['channel'].should == 1
    options['delay'].should == 50
    options['silent'].should be_false
    options['strategy'].should == 'test'
  end

  it 'should have allow options to be set' do
    _, options = Aud::CLI.start(%w[listen -s test -o 1 -n D -c 2 -d 10 --silent])
    options['octave'].should == 1
    options['note'].should == 'D'
    options['channel'].should == 2
    options['delay'].should == 10
    options['silent'].should be_true
    options['strategy'].should == 'test'
  end

  it 'should only allow tick or test' do
    expect {
      Aud::CLI.start(%w[listen -s nottest])
    }.to raise_error(/Only tick strategy/)
  end
end

