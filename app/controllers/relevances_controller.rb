class RelevancesController < ApplicationController
  respond_to :html, :js

  before_filter :user_required
  before_filter :load_comment

  def for
    Relevance.for(current_user, @comment) if @comment.votable_by?(current_user)
    respond_to do |wants|
      wants.html { redirect_to :back }
      wants.js   { render :text => "Merci pour votre vote" }
    end
  end

  def against
    Relevance.against(current_user, @comment) if @comment.votable_by?(current_user)
    respond_to do |wants|
      wants.html { redirect_to :back }
      wants.js   { render :text => "Merci pour votre vote" }
    end
  end

protected

  def load_comment
    @comment = Comment.find(params[:comment_id])
  end

end
