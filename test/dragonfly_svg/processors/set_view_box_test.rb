require 'test_helper'

module DragonflySvg
  module Processors
    describe SetViewBox do
      let(:app) { test_app.configure_with(:svg) }
      let(:processor) { DragonflySvg::Processors::SetViewBox.new }
      let(:svg) { Dragonfly::Content.new(app, SAMPLES_DIR.join('sample.svg')) }

      before do
        processor.call(svg, 0, 0, 400, 600)
      end

      it 'sets view box' do
        svg.data.must_include '0 0 400 600'
      end
    end
  end
end
