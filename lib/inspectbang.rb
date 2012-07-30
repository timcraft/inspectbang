require 'cgi'

module InspectBang
  class Exception < StandardError; end

  module Method
    def inspect!
      raise Exception.new(self.inspect)
    end
  end

  class Railtie < Rails::Railtie
    initializer 'inspectbang' do |app|
      ActionController::Base.rescue_from(Exception) do |exception|
        render :text => CGI.escapeHTML(exception.message)
      end

      Object.send(:include, Method)
    end
  end
end
