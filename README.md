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

## Background

I read this Wikipedia page
(<http://en.wikipedia.org/wiki/Hebrew_numerals>) and stole some ideas
from Andrew Vos's
[roman-numerals](https://github.com/AndrewVos/roman-numerals) code.

Thousands separator: I chose not to use one. I'm tired. And I didn't know the
rule for using a thousands separator in this context:

```
2001 => ב״א
```

Does this get a _gershayim_ or a thousands separator? Beats me. If
someone knows, please do tell me.