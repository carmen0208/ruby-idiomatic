$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))
require 'gem_love'
require 'shellwords'
require 'data_mapper'
# temporary thing to put module here:
module GemLove
  def self.gem_named(name)
    Rubygem.get(name)
  end

  Rubygem = Struct.new(:name) do
    def self.get(name)
      new(name)
    end

    def endorsements
      endorsement_list.all_for_gem_named(name)
    end

    def endorsement_list
      Endorsement
    end

  end
end

describe 'gem carmenlove command' do
  before :all do
    DataMapper.setup(:default, 'sqlite::memory:')
    DataMapper.auto_migrate!
   
  end

  specify 'endorsing a gem' do
    pending "completion of the server side"
    run 'gem carmenlove fattr'
    gem_named('fattr').should have(1).endorsements
  end

  def run(shell_command)
    args = shell_command.sub(/^gem carmenlove/, '').shellsplit
    command = Gem::Commands::LovecarmenCommand.new
    p 'I am here'
    p command
    p args
    command.invoke(*args)

  end

  def gem_named(name)
    GemLove.gem_named(name)
  end
end

