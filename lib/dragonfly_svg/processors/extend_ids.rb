require 'nokogiri'

module DragonflySvg
  module Processors
    class ExtendIds

      def call content, append_str=SecureRandom.urlsafe_base64(8)
        doc = Nokogiri::XML(content.data)

        # nodes with id attributes
        doc.xpath("//*[@id]").each do |node|
          node_id = node.get_attribute 'id'
          node.set_attribute 'id', [node_id, append_str].join('-')
        end

        # nodes with id references
        doc.xpath("//*[@href]").each do |node|
          node_href = node.get_attribute 'href'
          node.set_attribute 'href', [node_href, append_str].join('-')
        end

        content.update(doc.to_xml)
      end

    end
  end
end