# This migration comes from pageflow_panorama (originally 20140915133249)
class CreatePackages < ActiveRecord::Migration
  def change
    create_table :pageflow_panorama_packages do |t|
      Pageflow::HostedFile.columns(t)

      t.integer(:unpacking_progress)
      t.string(:unpacking_error_message)
      t.string(:index_document)
      t.attachment(:thumbnail)
    end
  end
end
