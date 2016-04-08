class MentorsController < ApplicationController
  def index
  	@search = Mentor.paginate(:page => params[:page], :per_page => 20).search(params[:q])
    @mentors = @search.result
  end

  private

  def filtering_params
  	params.slice(:name, :occupation)
  end
end
