require 'test_helper'

module DragonflySvg
  module Processors
    describe SetPreserveAspectRatio do
      let(:app) { test_app.configure_with(:svg) }
      let(:processor) { DragonflySvg::Processors::SetPreserveAspectRatio.new }
      let(:svg) { Dragonfly::Content.new(app, SAMPLES_DIR.join('sample.svg')) }

      describe 'with default value' do
        it 'adds preserveAspectRatio attribute' do
          processor.call(svg)
          svg.data.must_include 'preserveAspectRatio'
        end

        it 'sets default value' do
          processor.call(svg)
          svg.data.must_include 'xMinYMin meet'
        end
      end

      describe 'with specified value' do
        it 'adds preserveAspectRatio with specified value' do
          processor.call(svg, 'xMidYMid meet')
          svg.data.must_include 'xMidYMid meet'
        end
      end
    end
  end
end
