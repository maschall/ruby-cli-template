require 'thor'

module <%= project_name.capitalize %>
  class CLI < Thor
    desc "", ""
    method_option :version, :aliases => "-v", :type => :boolean, :desc => "Display the version"
    method_option :help, :aliases => "-h", :type => :boolean, :desc => "Display the help"
    def cli()
      if options[:version]
        puts "Version: #{VERSION}"
      else
        CLI.help
      end
    end
    
    default_task :cli
  end
end