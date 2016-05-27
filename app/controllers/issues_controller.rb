class IssuesController < ApplicationController
  def index
  	@issues = Issue.all
  end

  def show
  	@issue = Issue.find(params[:id])
  end

  def new
  	@issue = Issue.new
  end

  def create 
  	@issue = Issue.new(issue_params)
  	if @issue.save 
  		redirect_to issues_url 
  	end 
  end 

  private 

  def issue_params 
  	params.require(:issue).permit(:queue, :fix)
  end 

end
