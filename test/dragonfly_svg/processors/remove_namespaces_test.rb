require 'test_helper'

describe DragonflySvg::Processors::RemoveNamespaces do
  let(:app) { test_app.configure_with(:svg) }
  let(:content) { Dragonfly::Content.new(app, SAMPLES_DIR.join('sample.svg')) }
  let(:processor) { DragonflySvg::Processors::RemoveNamespaces.new }

  before { processor.call(content) }

  it { content.data.wont_include 'xmlns=' }
end
