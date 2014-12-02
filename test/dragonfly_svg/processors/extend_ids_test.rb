require 'test_helper'

module DragonflySvg
  module Processors
    describe ExtendIds do

      let(:app) { test_app.configure_with(:svg) }
      let(:processor) { DragonflySvg::Processors::ExtendIds.new }
      let(:analyser) { DragonflySvg::Analysers::SvgProperties.new }
      let(:svg) { Dragonfly::Content.new(app, SAMPLES_DIR.join('sample.svg')) }

      before do
        @orig_id = analyser.call(svg)[:id]
      end

      it 'adds unique ID' do
        processor.call(svg)
        analyser.call(svg)[:id].wont_equal @orig_id
      end

      it 'adds supplied string to ID' do
        processor.call(svg, 'foo')
        analyser.call(svg)[:id].must_equal "#{@orig_id}-foo"
      end

    end
  end
end