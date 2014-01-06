## Listen to your log files with `aud`

`aud` is an open source command line utility that plays sounds in response to text-based input. Pipe, cat, or tail your files to `aud` and **audibilize** them. Here's some ways to use `aud`:

+ Get an audio alert when exceptions happen.
+ Learn the *rhythm* of a system, like you would a car engine.
+ Sense the relationship between two or more concurrent components.

The human hearing system is remarkably good at [isolating sounds](http://physicsworld.com/cws/article/news/2013/jan/31/human-hearing-is-highly-nonlinear) and detecting patterns. Why not use it
to intuit more about how our information-processing systems work?

[The Sound of Sorting](http://panthema.net/2013/sound-of-sorting) uses video and sound to *show* you how sorting algorightms work, rather than just tell you. Bret Victor's talk [Inventing on Principle](http://vimeo.com/36579366) explains why creators need a physical, immediate connection to their creations. These and more inspired me to write `aud`.

### Install aud

`aud` is a Ruby gem, and should work with most Ruby versions. Install it as follows:

```
$ gem install aud
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

### Real-world example

Listen to web logs and get a sense for traffic volume and error rates.

```
$ tail -f access.log | grep 200 | aud -n C -d 10 &
$ tail -f access.log | grep 404 | aud -n B -d 100 &
$ tail -f access.log | grep 500 | aud -n F -d 500 &

```

##### Distributed systems

I use `aud` to understand and troubleshoot patterns within distributed systems, like the kind I work on at [Keen IO](https://keen.io).

Our distributed backend includes [Storm](http://storm-project.net/), [Cassandra](http://cassandra.apache.org/), [Kafka](https://kafka.apache.org/), [Zookeeper](http://zookeeper.apache.org/), and more. These applications form a complex realtime mesh of activity, and generate a *lot* of log files in doing so.

I use `ssh` and `aud` to listen to the whole system simultaneously. I get a more accurate **feeling** for what's happening by listening than by grepping for types of of text. As a result, I can detect errors and deviations in performance with just my ears. As you can imagine, this is way less exhausting than trying to read lines of text as they race by!

### Contributing

`aud` is by no means a flag on a summit, but rather a trailhead for exploring the relationship between sound, systems, and humans. As such, your comments and contributions are very welcome.

To hack on `aud`, clone or fork this repository. Then:

```
# install developement dependencies
$ bundle install

# run tests
$ bundle exec rake spec
```

### Credits and Acknowledgements

+ The excellent [UNIMidi gem](https://github.com/arirusso/unimidi) and [micromidi gem](https://github.com/arirusso/micromidi), on which `aud` is built
+ Bret Victor's talk [Inventing on Principle](http://vimeo.com/36579366), as inspiration
+ [The Sound of Sorting](http://panthema.net/2013/sound-of-sorting), as inspiration, and [@dkador](https://github.com/dkador) for first sharing it with me

### MIT License

Copyright (c) 2013 Josh Dzielak

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

