require 'spec_helper'
require 'midi'

describe Aud::Tick do
  def mock_midi
    @mock_midi ||= Object.new
  end

  def mock_output
    @mock_output ||= Object.new
  end

  let(:properties) { { :octave => 1, :channel => 2, :note => 'B' } }

  it 'should initialize with options' do
    aud = Aud::Tick.new(mock_output, properties, mock_midi)
    aud.properties.should == properties
  end

  it 'should play a note' do
    aud = Aud::Tick.new(mock_output, properties, mock_midi)
    mock_midi.should_receive(:octave).with(1)
    mock_midi.should_receive(:note).with('B', :channel => 2)
    mock_midi.should_receive(:off)
    aud.process('beep')
  end
end
