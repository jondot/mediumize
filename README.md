# Mediumize

[![Gem Version](https://img.shields.io/gem/v/mediumize.svg)](https://rubygems.org/gems/mediumize) 
[![Build Status](https://travis-ci.org/jondot/mediumize.svg?branch=master)](https://travis-ci.org/jondot/mediumize)

Automatically post (and cross-post) your markdown style blog posts to your [Medium](http://medium.com) account from [Jekyll](http://jekyllrb.com/), [Middleman](http://middlemanapp.com), [Hugo](http://gohugo.io/) and others.

Mediumize will only publish drafts, and never publicly.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mediumize'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mediumize

## Usage

Either via command line (suitable for manual / Hugo flows):

    $ mediumize -t your-medium-integration-token file1.md file2.md ... fileN.md

Or, integrate it via Ruby into your Jekyll / Middleman flow:

```ruby
require 'mediumize'
p = Mediumize::Publisher(
      :token => "your-medium-integration-token",
      :frontmatter => true
    )

%w{
 file1.md
 file2.md
 fileN.md
}.each do |file|
  puts p.publish(file)
end
```

## Development

1. `git clone https://github.com/jondot/mediumize && cd mediumize`
2. `bundle`
3. `rake test`
4. Optionally, use guard


# Contributing

Fork, implement, add tests, pull request, get my everlasting thanks and a respectable place here :).

### Thanks:

To all [contributors](https://github.com/jondot/mediumize/graphs/contributors)

# Copyright

Copyright (c) 2016 [Dotan Nahum](http://gplus.to/dotan) [@jondot](http://twitter.com/jondot). See [LICENSE](LICENSE.txt) for further details.
