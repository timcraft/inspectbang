require 'cgi'

module InspectBang
  if defined?(Rails)
    class Exception < StandardError; end

    module Method
      def inspect!
        raise Exception.new(self.inspect)
      end
    end

    class Railtie < Rails::Railtie
      initializer 'inspectbang' do |app|
        if defined?(ActionController::Rendering::RENDER_FORMATS_IN_PRIORITY) && ActionController::Rendering::RENDER_FORMATS_IN_PRIORITY.include?(:plain)
          ActionController::Base.rescue_from(Exception) do |exception|
            render :plain => exception.message
          end
        else
          ActionController::Base.rescue_from(Exception) do |exception|
            render :text => CGI.escapeHTML(exception.message)
          end
        end

        Object.send(:include, Method)
      end
    end
  elsif defined?(Sinatra)
    module Method
      def inspect!
        throw :halt, [200, CGI.escapeHTML(self.inspect)]
      end
    end

    Object.send(:include, Method)
  end
end
