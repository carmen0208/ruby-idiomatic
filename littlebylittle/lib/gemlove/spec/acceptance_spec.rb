$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))
require 'gem_love'
require 'shellwords'
require 'data_mapper'
require 'webmock/rspec'

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
    # add the webmock library to my acceptance test, 
    # and add an instruction to capture requests to the Gem-Love server. 
    # But instead of using webmock to construct a fake server, 
    # I instead tell it to use the real server class to handle all requests.
    
    #WebMock’s #to_rack method can use any rack app to respond to captured web requests
    
    #The net result is that I’m plugging the real client into the real server, 
    #and only faking out the HTTP connection between them.
    stub_request(:any, /^www.gemlove\.org/).to_rack(GemLove::Server)
    run 'gem carmenlove fattr'
    expect(gem_named('fattr')).to have(1).endorsements
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

