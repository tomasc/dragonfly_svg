require 'nokogiri'

module DragonflySvg
  module Processors
    class SetNamespace
      def call(content, namespace = 'http://www.w3.org/2000/svg')
        raise UnsupportedFormat unless SUPPORTED_FORMATS.include?(content.ext)

        doc = Nokogiri::XML(content.data)

        if svg_node = doc.xpath("//*[name()='svg']").first
          unless svg_node.namespace.href == namespace
            doc.remove_namespaces!
            svg_node.add_namespace(nil, namespace)
          end
        end

        content.update(doc.to_xml, 'name' => 'temp.svg')
      end
    end
  end
end
