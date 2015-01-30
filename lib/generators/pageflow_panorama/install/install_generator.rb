module PageflowPanorama
  class InstallGenerator < Pageflow::PageTypeInstallGenerator
    def engine
      Pageflow::Panorama::Engine
    end
  end
end
