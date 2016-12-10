require_relative '../../lib/gem_love/server'
# save it latter, it been said that because it would be a "Rack-compatible HTTP
# application"
require 'rack/test'

module GemLove
  describe Server do 
    describe 'receive a gem endorsement' do
      it 'records a new endorsment fot the given gem' do
        endorsement_list = double
        server = GemLove::Server.new(endorsement_list: endorsement_list)
        browser = Rack::Test::Session.new(Rack::MockSession.new(server))

        expect(endorsement_list).to receive(:add_endorsement_for_gem).with('fattr')
        browser.post('/endorsements/fattr')
      end
    end
  end
end
