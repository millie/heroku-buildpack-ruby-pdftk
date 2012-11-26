class BaseCustom
  attr_reader :build_path, :cache_path
  def initialize(*args)
    @build_path = args.first
    @cache_path = args.last || "#{build_path}/tmp/custom-source"
    return self
  end

  def run_stdout(command)
    %x{ #{command} 2>/dev/null }
  end
  def write_stdout(string)
    puts "-----> #{string}"
  end
  def compile
  end
  # def run_stdout(command)
  #   puts "will running #{command}"
  # end
  # def write_stdout(string)
  #   puts "-----> #{string}"
  # end
  def self.compile *args
    c = Pdftk.new(*args)
    c.compile
  end
end
require "custom/pdftk"