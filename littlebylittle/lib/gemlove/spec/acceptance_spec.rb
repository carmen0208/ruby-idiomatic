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

  def self.create_user(login)
    User.create(login: login)
  end

  def self.user_for_login(login)
    User.get(login)
  end

  Rubygem = Struct.new(:name) do
    def self.get(name)
      new(name)
    end

    def endorsements
      endorsement_list.all_for_gem_named(name)
    end

    def  endorsed_by?(login)
      endorsements.by_login(login).any?
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
    make_confirmed_user('carmen')
    make_confirmed_user('avdi')
    set_client_user('avdi')
    expect(gem_named('fattr')).not_to be_endorsed_by('avdi')
    run 'gem carmenlove fattr'
    expect(gem_named('fattr')).to be_endorsed_by('avdi')
    expect(gem_named('fattr')).not_to be_endorsed_by()
  end

  def make_confirmed_user(login)  
    user = GemLove.create_user(login)
    raise "Unable to create user " unless user.saved?
  end

  def set_client_user(login)
    user = GemLove.user_for_login(login)
    @client_key = user.client_key
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

