require 'test_helper'

module DragonflySvg
  module Processors
    describe SetDimensions do
      let(:app) { test_app.configure_with(:svg) }
      let(:processor) { DragonflySvg::Processors::SetDimensions.new }
      let(:analyser) { DragonflySvg::Analysers::SvgProperties.new }
      let(:svg) { Dragonfly::Content.new(app, SAMPLES_DIR.join('sample.svg')) }

      before do
        processor.call(svg, 400, 600)
      end

      it 'sets width' do
        analyser.call(svg)[:width].must_equal 400
      end

      it 'sets height' do
        analyser.call(svg)[:height].must_equal 600
      end
    end
  end
end
