class IssuesController < ApplicationController
  
  def index
    @issues = Issue.all
    if params[:search]
      @issues = Issue.search(params[:search])
    end 
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
  		respond_to do |format|
        format.html { redirect_to root_path }
        format.json { head :no_content }
      end
  	end 
  end 

  def edit
    @issue = Issue.find(params[:id]) 
  end 

  def update 
    @issue = Issue.find(params[:id])
    if @issue.update_attributes(issue_params)
      redirect_to root_path
    else 
      render 'edit'
    end 
  end 



  private 

  def issue_params 
  	params.require(:issue).permit(:queue, :solution)
  end 
end
