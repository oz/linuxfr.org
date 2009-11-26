class VotesController < ApplicationController
  before_filter :user_required

  def for
    node = Node.find(params[:node_id])
    Vote.for(current_user, node) if node.content.votable_by?(current_user)
    node.content.boards.vote.create(:message => "#{current_user.name} a voté Pour", :user_agent => request.user_agent, :user_id => current_user.id)
    redirect_to_content node.content
  end

  def against
    node = Node.find(params[:node_id])
    Vote.against(current_user, node) if node.content.votable_by?(current_user)
    redirect_to_content node.content
  end

end
