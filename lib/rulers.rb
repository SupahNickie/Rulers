require "rulers/version"
require "rulers/routing"
require "rulers/util"
require "rulers/dependencies"
require "rulers/controller"
require "rulers/file_model"

module Rulers
  class Application
    def redirect_to(location)
      [302, {"Location" => location}, []]
    end

    def call(env)
      # `echo debug > debug.txt`
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      end
      if env['PATH_INFO'] == '/'
        return [404, {'Content-Type' => 'text/html'}, ["No home page yet"]]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      begin
        text = controller.send(act)
        if controller.get_response
          st, hd, rs = controller.get_response.to_a[st, hd, [rs.body].flatten]
        else
          [200, {'Content-Type' => 'text/html'}, [text]]
        end
      rescue Exception => e
        text = "<!DOCTYPE html><html><head></head><body>"
        text += "Sorry, a #{e.class}:#{e.message} exception happened.<br>\n"
        text += "<ul>"
        e.backtrace.each do |line|
          text += "<li>#{line}</li>"
        end
        text += "</ul></body></html>"
      end
      [200, {'Content-Type' => 'text/html'}, [text]]
    end
  end

end
