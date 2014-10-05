# Hebrumerator

Convert Arabic numerals to Hebrew and the also the other way too.

## Install

Clone this thing and add the `hebrumerator/bin` directory to your path.

Or you can use the Hebrumerator module in your own code.

```ruby
require 'lib/hebrumerator'

Hebrumerator.to_hebrew 1  # => א׳

```

## Use

Create some Hebrew numerals.

```shell
$ a2h 15
ט״ו
$ a2h 432
תל״ב
$ a2h 3604
גתר״ד
$ a2h 1
א׳
```

Or, make some Arabic ones from Hebrew.

```shell
$ h2a א׳
1
$ h2a גתר״ד
3604
$ h2a תל״ב
432
$ h2a ט״ו
15

```