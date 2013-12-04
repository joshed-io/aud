require 'midi'

module Aud
  class Tick

    attr_accessor :midi
    attr_accessor :output
    attr_accessor :properties

    def initialize(output, properties)
      self.midi = MIDI::IO.new(output)
      self.properties = properties
    end

    def process(line)
      self.midi.octave properties[:octave] || 3
      self.midi.note(to_note(line), :channel => properties[:channel])
      self.midi.off
    end

    private

    def to_note(line)
      "C"
    end
  end
end
