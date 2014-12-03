require 'test_helper'

module DragonflySvg
  describe Plugin do

    let(:app) { test_app.configure_with(:svg) }
    let(:svg) { app.fetch_file(SAMPLES_DIR.join('sample.svg')) }

    # ---------------------------------------------------------------------

    describe 'analysers' do
      it 'adds #svg_properties' do
        svg.must_respond_to :svg_properties
      end
    end

    # ---------------------------------------------------------------------

    describe 'processors' do
      it 'adds #extend_ids' do
        svg.must_respond_to :extend_ids
      end

      it 'adds #remove_namespaces' do
        svg.must_respond_to :remove_namespaces
      end

      it 'adds #set_dimensions' do
        svg.must_respond_to :set_dimensions
      end

      it 'adds #set_namespace' do
        svg.must_respond_to :set_namespace
      end

      it 'adds #set_preserve_aspect_ratio' do
        svg.must_respond_to :set_preserve_aspect_ratio
      end

      it 'adds #set_view_box' do
        svg.must_respond_to :set_view_box
      end
    end

  end
end