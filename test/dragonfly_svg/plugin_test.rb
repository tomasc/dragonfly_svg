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

      it 'adds #width' do
        svg.must_respond_to :width
        svg.width.must_equal 200.0
      end

      it 'adds #height' do
        svg.must_respond_to :height
        svg.height.must_equal 300.0
      end

      it 'adds #aspect_ratio' do
        svg.must_respond_to :aspect_ratio
        svg.aspect_ratio.must_equal 0.6666666666666666
      end

      it 'adds #portrait' do
        svg.must_respond_to :portrait
        svg.portrait.must_equal true
      end

      it 'adds #landscape' do
        svg.must_respond_to :landscape
        svg.landscape.must_equal false
      end

      it 'adds #id' do
        svg.must_respond_to :id
      end

      describe "when handling non svg files" do
        let(:png) { app.fetch_file(SAMPLES_DIR.join('sample.png')) }

        before do
          test_app.configure_with(:image_magick)
        end

        it 'still works to get the width' do
          png.width.must_equal 1
        end

        it 'still works to get the height' do
          png.height.must_equal 1
        end

        it 'still works to get the aspect ratio' do
          png.aspect_ratio.must_equal 1.0
        end

        it 'still works to ask for portrait' do
          png.portrait.must_equal true
        end

        it 'still works to ask for landscape' do
          png.landscape.must_equal false
        end
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
