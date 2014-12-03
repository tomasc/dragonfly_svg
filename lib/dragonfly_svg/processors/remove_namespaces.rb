require 'nokogiri'

module DragonflySvg
  module Processors
    class RemoveNamespaces

      def call content
        doc = Nokogiri::XML(content.data)

        doc.remove_namespaces!

        content.update(doc.to_xml)
      end
    end
  end
end