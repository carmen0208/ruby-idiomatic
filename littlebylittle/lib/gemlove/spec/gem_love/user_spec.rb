require "spec_helper"
require "gem_love/user"

module GemLove
  describe User do 
    let(:user) { User.new }
    it { 
      expect(user.client_key).to match(/[[:xdigit:]]{32}/)
    }
  end
end
