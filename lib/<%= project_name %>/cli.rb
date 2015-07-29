require 'thor'

module <%= project_name.capitalize %>
  class CLI < Thor
    desc "", ""
    method_option :version, :aliases => "-v", :type => :boolean, :desc => "Display the version"
    method_option :help, :aliases => "-h", :type => :boolean, :desc => "Display the help"
    def cli()
      if options[:version]
        puts "Version: #{VERSION}"
      elsif !options[:help]
        # YOUR DEFAULT CODE GOES HERE
      else
        CLI.help
      end
    end
  
    Dir[File.expand_path('../subcommands/*.rb', __FILE__)].each do |file|
      filename = File.basename(file, ".rb")
      require_relative "subcommands/#{filename}"
      desc "#{filename} [COMMANDS]", ""
      subcommand filename, <%= project_name.capitalize %>.const_get(filename.capitalize)
    end
    
    default_task :cli
  end
end