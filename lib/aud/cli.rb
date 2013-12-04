require 'thor'

module Aud
  class CLI < Thor

    default_task :listen

    desc 'listen', 'Listens to STDIN or a file'

    method_option :octave,
      default: 3,
      aliases: '-o',
      banner: 'Set an octave [1-5]'

    method_option :file,
        aliases: '-f',
        banner: 'A file to listen to'

    method_option :channel,
       default: 1,
       aliases: '-c',
       type: :numeric,
       banner: 'Set a MIDI channel [1-16]'

    method_option :delay,
       default: 50,
       aliases: '-d',
       type: :numeric,
       banner: 'Minimum delay in milliseconds between sounds'

    method_option :strategy,
        default: 'tick',
        aliases: '-s',
        banner: 'A strategy for making sounds, currently only tick'

    method_option :notext,
        type: :boolean,
        default: false,
        aliases: '-n',
        banner: 'Suppress text output'

    def listen
      output = UniMIDI::Output.first

      if options[:strategy] == 'tick'
        aud = Aud::Tick.new(output, options)
      else
        raise 'Only tick strategy is supported, but feel free to contribute another!'
      end

      _exit = false
      Signal.trap(:INT)  do _exit = true end
      Signal.trap(:TERM) do _exit = true end

      process_line = lambda { |line|
        line = line.strip
        aud.process(line)
        puts line unless options[:notext]
        sleep(options[:delay] / 1000.0)
      }

      if options[:file]
        File.open(options[:file]).each do |line|
          process_line.call(line) unless _exit
        end
      else
        # fixup ARGF
        ARGV.clear
        ARGF.each_line do |line|
          process_line.call(line) unless _exit
        end
      end
    end
  end
end
