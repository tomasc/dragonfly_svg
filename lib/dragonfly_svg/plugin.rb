require 'dragonfly_svg/analysers/svg_properties'

require 'dragonfly_svg/processors/extend_ids'
require 'dragonfly_svg/processors/remove_namespaces'
require 'dragonfly_svg/processors/set_attribute'
require 'dragonfly_svg/processors/set_dimensions'
require 'dragonfly_svg/processors/set_namespace'
require 'dragonfly_svg/processors/set_preserve_aspect_ratio'
require 'dragonfly_svg/processors/set_view_box'

module DragonflySvg
  class Plugin
    def call(app, options = {})
      # Analysers
      app.add_analyser :svg_properties, Analysers::SvgProperties.new

      app.add_analyser :width do |content|
        content.analyse(:svg_properties)['width']
      end

      app.add_analyser :height do |content|
        content.analyse(:svg_properties)['height']
      end

      app.add_analyser :xres do |content|
        content.analyse(:svg_properties)['xres']
      end

      app.add_analyser :yres do |content|
        content.analyse(:svg_properties)['yres']
      end

      app.add_analyser :format do |content|
        content.analyse(:svg_properties)['format']
      end

      app.add_analyser :aspect_ratio do |content|
        content.analyse(:width).to_f / content.analyse(:height).to_f
      end

      app.add_analyser :portrait do |content|
        content.analyse(:aspect_ratio) < 1.0
      end

      app.add_analyser :landscape do |content|
        !content.analyse(:portrait)
      end

      app.add_analyser :id do |content|
        content.analyse(:svg_properties)['id']
      end

      # Aliases
      app.define(:portrait?) { portrait }
      app.define(:landscape?) { landscape }

      # Processors
      app.add_processor :extend_ids, Processors::ExtendIds.new
      app.add_processor :remove_namespaces, Processors::RemoveNamespaces.new
      app.add_processor :set_attribute, Processors::SetAttribute.new
      app.add_processor :set_dimensions, Processors::SetDimensions.new
      app.add_processor :set_namespace, Processors::SetNamespace.new
      app.add_processor :set_preserve_aspect_ratio, Processors::SetPreserveAspectRatio.new
      app.add_processor :set_view_box, Processors::SetViewBox.new
    end
  end
end

Dragonfly::App.register_plugin(:svg) { DragonflySvg::Plugin.new }
