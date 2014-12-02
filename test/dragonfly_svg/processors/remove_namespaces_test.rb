require 'test_helper'

module DragonflySvg
  module Processors
    describe RemoveNamespaces do

      let(:app) { test_app.configure_with(:svg) }
      let(:processor) { DragonflySvg::Processors::RemoveNamespaces.new }
      let(:svg) { Dragonfly::Content.new(app, SAMPLES_DIR.join('sample.svg')) }

      it 'removes namespaces' do
        processor.call(svg)
        svg.data.wont_include 'xmlns='
      end

    end
  end
end