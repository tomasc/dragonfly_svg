require 'test_helper'

module DragonflySvg
  module Processors
    describe SetNamespace do

      let(:app) { test_app.configure_with(:svg) }
      let(:processor) { DragonflySvg::Processors::SetNamespace.new }
      let(:svg) { Dragonfly::Content.new(app, SAMPLES_DIR.join('sample.svg')) }

      it 'sets default namespace' do
        processor.call(svg)
        svg.data.must_include 'http://www.w3.org/2000/svg'
      end

      it 'sets custom namespace' do
        processor.call(svg, 'custom_namespace')
        svg.data.must_include 'custom_namespace'
      end

    end
  end
end