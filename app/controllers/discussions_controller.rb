class DiscussionsController < BaseController
  layout 'light'

  def new
    @discussion = @group.discussions.build
    unless params[:message_id]
      @discussion.build_message
    else
      @discussion.message_id = params[:message_id]
    end
  end

  def create
    @discussion = @group.discussions.build(params[:discussion])

    if params[:discussion][:message_attributes]
      @discussion.message.author = current_user 
    end

    if @discussion.save
      redirect_to [@group, @discussion]
    else
      render :new
    end
  end

  def show
    @discussion = @group.discussions.find(params[:id])
  end

  
end
