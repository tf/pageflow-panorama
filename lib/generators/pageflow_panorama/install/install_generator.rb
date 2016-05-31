module PageflowPanorama
  class InstallGenerator < Rails::Generators::Base
    desc 'Install the Pageflow page type and the necessary migrations.'

    def register_page_type
      inject_into_file 'config/initializers/pageflow.rb', after: "Pageflow.configure do |config|\n" do
        "  config.register_page_type(Pageflow::#{engine_name_suffix.camelize}.page_type)\n"
      end
    end

    def require_assets
      append_asset_require_to('pageflow/application.js', "pageflow/#{engine_name_suffix}")
      append_asset_require_to('pageflow/editor.js', "pageflow/#{engine_name_suffix}/editor")

      append_asset_import_to('pageflow/application.scss', "pageflow/#{engine_name_suffix}")
      append_asset_import_to('pageflow/editor.scss', "pageflow/#{engine_name_suffix}/editor")
    end

    def mount_engine
      if engine_file?('config/routes.rb')
        route("authenticated { mount #{engine.name}, at: '/#{engine_name_suffix}' }\n")
      end
    end

    def install_migrations
      if engine_file?('db/migrate')
        rake "pageflow_#{engine_name_suffix}:install:migrations"
      end
    end

    private

    def engine
      Pageflow::Panorama::Engine
    end

    def engine_name_suffix
      engine.engine_name.gsub(/^pageflow_/, '')
    end

    def engine_file?(*path)
      File.exist?(engine.root.join(*path))
    end

    def append_asset_require_to(file, required_file)
      if engine_file?('app', 'assets', 'javascripts', "#{required_file}.js")
        append_to_file "app/assets/javascripts/#{file}" do
          "\n//= require #{required_file}\n"
        end
      end
    end

    def append_asset_import_to(file, imported_file)
      if engine_file?('app', 'assets', 'stylesheets', "#{imported_file}.css.scss")
        append_to_file "app/assets/stylesheets/#{file}" do
          %'\n@import "#{imported_file}";\n'
        end
      end
    end
  end
end
