# Audibilize your log files with `aud`

`aud` is an open source command line utility that plays sounds in response to text-based input. Pipe, cat, or tail your files to `aud` and *listen* to them. Here's some ways to use aud:

+ Get an audio alert when exceptions happen.
+ Learn the *rhythm* of a system, like you would a car engine.
+ Sense the relationship between two or more concurrent components.

The human hearing system is remarkably good at [isolating sounds](http://physicsworld.com/cws/article/news/2013/jan/31/human-hearing-is-highly-nonlinear) and detecting patterns. Why not use it
to intuit more about how our information-processing systems work?

[The Sound of Sorting](http://panthema.net/2013/sound-of-sorting) uses video and sound to *show* you how sorting algorightms work, rather than just tell you. Bret Victor's talk,
[Inventing on Principle](http://vimeo.com/36579366), explains why creators need a physical, immediate connection to their creations. These and more inspired me to write `aud`.

### Install aud

`aud` is a Ruby gem, and should work with most Ruby versions. Install it as follows:

```
gem install aud
```

Once installed, the `aud` command should be available on your path. You can print help information to be sure.

```
$ aud help listen
```

### MIDI Setup

You won't hear anything until you configure a MIDI input and output. Here follows instructions for Mac OSX, but other operating systems should also work. If you get it working on your platform I'd love to know and add more instructions!

##### Mac OSX Instructions

1) *Enable the IAC Driver* - Open "Audio MIDI Setup" in your System Preferences. Choose "Open MIDI Window" from the "Windows" option in the Menu Bar. Double-click on "IAC Driver", and check "Device is online".

<img src="/images/audio_midi_setup.png" alt="Audio MIDI Setup">

2) *Download SimpleSynth* - SimpleSynth will play aloud the signals coming across the IAC Driver virtual MIDI controller. Download it [here](http://notahat.com/simplesynth/) and install it. Run it, and make sure the IAC Driver is selected. (Note: You can also use GarageBand [as described here](http://tx81z.blogspot.com/2011/06/osx-unimidi-and-midi-patch-bay.html).)

<img src="/images/simple_synth.png" alt="SimpleSynth">

(Protip: Turn Channel 2 to "Fl.Key Click" as shown in the screenshot. It sounds cool :)

### Usage

`aud` accepts input via STDIN, just like grep, awk, or sed. That means you can cat, echo, or tail lines of text to it. Here's an example:

```
$ cat access.log | aud
```

If everything is set up correctly, you should hear a note played for each line of the log file.

The pitch, octave, and duration of the note are configurable. Here's the full set of options, taken from `aud help listen`:

```
  -o, [--octave=Set an octave [1-5]]
                                                                      # Default: 3
  -n, [--note=The note to play [A-G]]
                                                                      # Default: C
  -f, [--file=A file to listen to]
  -c, [--channel=Set a MIDI channel [1-16]]
                                                                      # Default: 1
  -d, [--delay=Minimum delay in milliseconds between sounds]
                                                                      # Default: 50
  -s, [--strategy=A strategy for making sounds, currently only tick]
                                                                      # Default: tick
      [--silent=Suppress printing of input]
```


### Contributing

`aud` is by no means a flag on a summit, but rather a trailhead for exploring the relationship between sound, systems, and humans. As such, your comments and contributions are very welcome.

