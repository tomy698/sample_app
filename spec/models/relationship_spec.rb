# == Schema Information
#
# Table name: relationships
#
#  id          :integer          not null, primary key
#  follower_id :integer
#  followed_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Relationship do

  before(:each) do
    @follower = Factory(:user)
    @followed = Factory(:user, :email => Factory.next(:email))

    @relationship = @follower.relationships.build(:followed_id => @followed.id)
  end

  it "devrait creer une nouvelle instance en donnant des attributs valides" do
    @relationship.save!
  end

  describe "relationships" do

    before(:each) do
      @user = User.create!(@attr)
      @followed = Factory(:user)
    end

    it "devrait avoir une methode relashionships" do
      @user.should respond_to(:relationships)
    end
  end

  describe "Methodes de suivi" do

    before(:each) do
      @relationship.save
    end

    it "devrait avoir un attribut follower (lecteur)" do
      @relationship.should respond_to(:follower)
    end

    it "devrait avoir le bon lecteur" do
      @relationship.follower.should == @follower
    end

    it "devrait avoir un attribut  followed (suivi)" do
      @relationship.should respond_to(:followed)
    end

    it "devrait avoir le bon utilisateur suivi (auteur)" do
      @relationship.followed.should == @followed
    end
  end

  describe "validations" do

    it "devrait exiger un attribut follower_id" do
      @relationship.follower_id = nil
      @relationship.should_not be_valid
    end

    it "devrait exiger un attribut followed_id" do
      @relationship.followed_id = nil
      @relationship.should_not be_valid
    end
  end
end
