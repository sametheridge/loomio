require 'spec_helper'

describe DiscussionsController do
  context 'within a group' do
    before :each do
      @user = User.make!
      @group = Group.make!
      @group.memberships.create(user: @user, access_level: 'member')
      sign_in @user
    end

    it 'shows new' do
      get :new, group_id: @group.id
      response.should render_template 'new'
      response.should be_success
    end

    it 'creates discussions with a message' do
      post :create, 
        group_id: @group.id,
        discussion: 
          {title: 'new discussion', 
           message_attributes: {body: 'hello, what do yu thngk?'}}
      response.should be_redirect
      assigns(:discussion).should be_valid
      assigns(:discussion).message.author.should == @user
    end

    it 'shows discussion' do

    end
  end
end
