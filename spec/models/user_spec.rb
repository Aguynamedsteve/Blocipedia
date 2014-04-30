require 'spec_helper'

describe User do
  describe '#wikis' do
    it 'shows wikis' do
      user = FactoryGirl.create :user
      wiki = FactoryGirl.create :wiki, user_id: user.id

      expect(user.wikis.count).to eq(1)
    end
  end
end




