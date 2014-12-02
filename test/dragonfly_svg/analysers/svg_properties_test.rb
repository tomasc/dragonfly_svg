require 'test_helper'

module DragonflySvg
  module Analysers
    describe SvgProperties do

      let(:app) { test_app.configure_with(:svg) }
      let(:analyser) { DragonflySvg::Analysers::SvgProperties.new }
      let(:svg) { app.fetch_file(SAMPLES_DIR.join('sample.svg')) }

      describe 'call' do
        let(:svg_properties) { analyser.call(svg) }
        let(:ratio) { 200.0 / 300.0 }

        it 'returns Hash' do
          svg_properties.must_be_kind_of Hash
        end

        it ':width' do
          svg_properties[:width].must_equal 200
        end

        it ':height' do
          svg_properties[:height].must_equal 300
        end

        it ':aspect_ratio' do
          svg_properties[:aspect_ratio].must_equal ratio
        end

        it ':id' do
          svg_properties[:id].must_equal 'sample_id'
        end
      end

    end
  end
end