require 'spec_helper'

describe MessagesController do
  context 'within a group' do
    context 'on a discussion' do
      before :each do
        @user = User.make!
        @group = Group.make!
        @group.memberships.create(user: @user, access_level: 'member')
        @discussion = @group.discussions.build(title:'jesus')
        @parent_message = @discussion.build_message(author: @user, body: 'yo')
        puts @discussion.save!
        sign_in @user
      end
      it 'creates a reply message' do
        post :create, 
          group_id: @group.id,
          discussion_id: @discussion.id,
          message: {body: 'yo', parent_id: @parent_message.id}
        response.should be_redirect
        assigns(:message).should be_valid
        assigns(:message).parent.should == @parent_message
        assigns(:message).author.should == @user
      end
    end
  end
end
