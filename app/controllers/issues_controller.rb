class IssuesController < ApplicationController
  load_resource

  def index
  end

  def show
  end

  def new
  end

  def create
    @issue = Issue.new issue_params
    @issue.save!
    redirect_to issues_path, notice: t("issue.create", name: @issue.name)
  end

  def edit
  end

  def update
    @issue.update! issue_params
    render nothing: true
  end

  def destroy
    @issue.destroy
    render nothing: true
  end

  Issue::STATUSES.each do |status|
    define_method status do
      @issue.change_status! status
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:name, :status, :subtask_id)
  end

end
