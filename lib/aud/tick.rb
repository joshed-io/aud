require 'midi'

module Aud
  class Tick

    attr_accessor :midi
    attr_accessor :output
    attr_accessor :properties

    def initialize(output, properties, _midi=nil)
      self.midi = _midi || MIDI::IO.new(output)
      self.properties = properties
    end

    def process(line)
      self.midi.octave(properties[:octave])
      self.midi.note(properties[:note], :channel => properties[:channel])
      self.midi.off
    end
  end
end
