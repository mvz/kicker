class Kicker
  attr_accessor :path, :command
  attr_reader :file
  
  def initialize(options)
    self.path = options[:path] if options[:path]
    @command = options[:command]
  end
  
  def path=(path)
    @path = File.expand_path(path)
    @file, @path = @path, File.dirname(@path) unless File.directory?(@path)
  end
  
  def start
    validate_options!
  end
  
  private
  
  def validate_options!
    validate_path_and_command!
    validate_path_exists!
  end
  
  def validate_path_and_command!
    unless @path && @command
      puts "Usage: #{$0} [PATH] [COMMAND]"
      exit
    end
  end
  
  def validate_path_exists!
    unless File.exist?(@path)
      puts "The given path `#{@path}' does not exist."
      exit 1
    end
  end
end