module <%= project_name.capitalize %>
  class CLI
    def initialize(argv)
      @argv = argv
    end
    
    def run
      parse_command_line_options
    end
    
    private
    
    def parse_command_line_options
      begin
        global_options.parse!(@argv)
      rescue OptionParser::InvalidOption => e
        puts e
        print_help
      end
    end
    
    def global_options
      OptionParser.new do |opts|
        opts.banner = 'Usage: <%= project_name %> [-v | --version] [-h | --help]'
        
        opts.on('-v', '--version', 'Display the version and exit') do
          puts "Version: #{VERSION}"
          exit
        end
        
        opts.on('-h', '--help', 'Display this help message') do
          puts opts
          exit
        end
        
      end
    end
    
    def print_help
      global_options.parse!(['-h'])
    end

  end
end