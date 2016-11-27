class Gem::Commands::LovecarmenCommand < Gem::Command
  def initialize
    super 'lovecarmen', "Tell the world of your love for a gem"
  end

  def arguments
    "GEM_NAME                the name of the gem you wish to endorse"
  end

  def usage
    "#{program_name} GEM_NAME"
  end

  def description
    <<END
Records your appreciation for a gem on gemlovecarmen learning
END
  end

  def execute
    puts "Under construction...."
  end
end
