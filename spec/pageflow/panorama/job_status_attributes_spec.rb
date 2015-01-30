require 'spec_helper'

module Pageflow
  module Panorama
    describe JobStatusAttributes do
      describe '#handle' do
        it 'updates phase progress attribute when passed block is called' do
          record = Package.create!(unpacking_progress: 0)

          JobStatusAttributes.handle(record, stage: :unpacking) do |&progress|
            progress.call(20)
          end

          expect(record.reload.unpacking_progress).to eq(20)
        end

        it 'sets phase error message if error with message_i18n_key is raised' do
          record = Package.create!(unpacking_progress: 0)
          error_with_message_i18n_key = Class.new(RuntimeError) do
            def message_i18n_key
              :i18n_key
            end
          end

          begin
            JobStatusAttributes.handle(record, stage: :unpacking) do |&progress|
              raise(error_with_message_i18n_key.new)
            end
          rescue error_with_message_i18n_key
          end

          expect(record.unpacking_error_message).to eq(:i18n_key)
        end
      end
    end
  end
end
