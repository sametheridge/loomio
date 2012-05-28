require 'spec_helper'

describe RatingsController do
  before :each do
    @group = Group.make!
    @message = Message.make
    @discussion = Discussion.make!(message: @message)
    @group.memberships.create!(user: @user, access_level: 'member')
    @user = User.make!
    sign_in @user
  end

  it 'creates ratings' do
    post :create, rating: {discussion_id: @discussion.id, message_id: @message.id, useful: 'true'}
    response.should be_redirect
    assigns(:rating).should be_persisted
    assigns(:rating).author.should == @user
  end

end
