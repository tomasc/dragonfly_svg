# Dragonfly SVG

[![Build Status](https://travis-ci.org/tomasc/dragonfly_svg.svg)](https://travis-ci.org/tomasc/dragonfly_svg) [![Gem Version](https://badge.fury.io/rb/dragonfly_svg.svg)](http://badge.fury.io/rb/dragonfly_svg) [![Coverage Status](https://img.shields.io/coveralls/tomasc/dragonfly_svg.svg)](https://coveralls.io/r/tomasc/dragonfly_svg)

[Dragonfly](https://github.com/markevans/dragonfly) analyser and processors for SVGs.

Uses the [nokogiri](http://nokogiri.org) gem for SVG parsing.

## Installation

Add this line to your application's Gemfile:

    gem 'dragonfly_svg'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dragonfly_svg

## Usage
The analyser and processors are added by configuring the plugin

```ruby
Dragonfly.app.configure do
  plugin :svg
end
```

## Supported Formats

List of supported formats is available as:

```ruby
DragonflySvg::SUPPORTED_FORMATS # => ["svg", "svgz", "svg.gz"]
```

## Analyser
The analyser supplies the following methods:

```ruby
svg.width
svg.height
svg.aspect_ratio
svg.id
svg.portrait?
svg.landscape?
```

## Processors

### ExtendIds

Adds a random string to the `id`. Helpful when embedding SVGs, in which case the `id` should be unique. You can also supply your own String.

```ruby
svg.extend_ids
svg.extend_ids('foo')
```

### RemoveNamespaces

Removes the `xmlns` namespace from the SVG.

```ruby
svg.remove_namespaces
```

### SetAttribute

Allows to set attribute for specified `xpath`:

```ruby
svg.set_attribute('./*[name()="svg"]', 'style', 'margin: 50px;')
```

### SetTagValue

Allows to set tag value for specified `xpath`:

```ruby
svg.set_tag_value('./*[name()="text"]', 'Updated text')
```

### SetDimensions

Sets the dimensions of the SVG. Takes two parameters: `width` and `height`

```ruby
svg.set_dimensions(210, 297)
```

### SetNamespace

Sets the `xmlns` namespace of the SVG. Default is `http://www.w3.org/2000/svg` unless something is supplied.

```ruby
svg.set_namespace                     # xmlns="http://www.w3.org/2000/svg"
svg.set_namespace('foo')              # xmlns="foo"
```

### SetPreserveAspectRatio

Sets the `preserveAspectRatio` attribute of the SVG. Default is `xMinYMin meet` unless something is supplied.

```ruby
svg.set_preserve_aspect_ratio         # preserveAspectRatio="xMinYMin meet"
svg.set_preserve_aspect_ratio('foo')  # preserveAspectRatio="foo"
```

### SetViewBox

Sets the `viewBox` attribute of the SVG. Takes four parameters: `min_x`, `min_y`, `width` and `height`.

```ruby
svg.set_view_box(0, 0, 400, 600)       # viewBox="0 0 400 600"
```

## Contributing

1. Fork it ( https://github.com/tomasc/dragonfly_svg/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
