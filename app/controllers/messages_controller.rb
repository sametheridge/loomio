class MessagesController < BaseController
  before_filter :load_discussion

  def create
    @message = current_user.messages.create!(params[:message])
    respond_to do |format|
      format.html {redirect_to [@group, @discussion]}
      format.js {render 'create'}
    end
  end

  protected
  def load_discussion
    puts params
    @discussion = @group.discussions.find(params[:discussion_id])
  end
end
