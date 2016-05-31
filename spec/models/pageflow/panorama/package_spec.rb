require 'spec_helper'

module Pageflow
  module Panorama
    describe Package, inline_resque: true do
      describe '#process' do
        it 'unpacks archive to s3' do
          zip_file = File.open(Engine.root.join('spec', 'fixtures', 'panorama.zip'))
          package = Package.create!(attachment: zip_file)

          package.publish!

          expect(package.reload.thumbnail).to be_present
        end
      end
    end
  end
end
