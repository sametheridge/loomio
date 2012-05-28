class BaseController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :load_group

  def load_group
    @group = current_user.groups.find(params[:group_id])
  end
end
