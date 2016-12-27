require_relative '../../lib/rubygems/commands/lovecarmen_command'
require 'webmock/rspec'

module GemLove
  describe GemUser do 
    describe '#endorse_gem' do
      it 'registers a gem endorsement with the gem-love server' do
        gem_user = GemUser.new
        stub_request(:any, 'www.gemlove.org/endorsements/fattr')
        #stub_request(:post, "http://www.gemlove.org/endorsements/fattr").
        # with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/x-www-form-urlencoded', 'Host'=>'www.gemlove.org', 'User-Agent'=>'Ruby'}).
        # to_return(:status => 200, :body => "", :headers => {})
        gem_user.endorse_gem("fattr")
        expect(a_request(:post, 'www.gemlove.org/endorsements/fattr')).
          to have_been_made
 
      end
    end
  end
end
