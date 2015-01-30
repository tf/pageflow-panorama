require 'spec_helper'

module Pageflow
  module Panorama
    describe UnpackToS3 do
      describe '#upload' do
        it 'writes files to s3 bucket' do
          archive = Zip::File.open(Engine.root.join('spec', 'fixtures', 'some.txt.zip'))
          s3_object = double('S3 object', write: true)
          s3_bucket = double('S3 Bucket', objects: {'base/some.txt' => s3_object})
          unpack_to_s3 = UnpackToS3.new(archive: archive,
                                        destination_bucket: s3_bucket,
                                        destination_base_path: 'base')

          unpack_to_s3.upload

          expect(s3_object).to have_received(:write)
        end

        it 'reports progress' do
          archive = Zip::File.open(Engine.root.join('spec', 'fixtures', 'some.txt.zip'))
          s3_object = double('S3 object', write: true)
          s3_bucket = double('S3 Bucket', objects: {'base/some.txt' => s3_object})
          unpack_to_s3 = UnpackToS3.new(archive: archive,
                                        destination_bucket: s3_bucket,
                                        destination_base_path: 'base')

          expect { |probe| unpack_to_s3.upload(&probe) }.to yield_with_args(0)

          expect(s3_object).to have_received(:write)
        end
      end
    end
  end
end
