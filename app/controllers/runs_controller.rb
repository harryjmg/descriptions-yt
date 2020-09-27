class RunsController < ApplicationController
  before_action :authenticate_user!

  def select_videos
    current_user.channel.load_videos if current_user.channel.videos.empty?

    @videos = current_user.channel.videos
    @run = Run.new
  end

  def edit_descriptions
    @run = current_user.runs.find(params[:id])
    @blocks = @run.blocks
  end

  def publish_changes
    @run = current_user.runs.find(params[:id])
    @run.calculate_cost
    @blocks = @run.select_modified_blocks
  end

  def publish_changes_online
    @run = current_user.runs.find(params[:id])

    if @run.cost <= current_user.credit
      @run.push_youtube
      redirect_to runs_done_path
    else
      redirect_to credit_index_path
    end
  end

  def done
    @run = current_user.runs.find(params[:id])
  end

  def reload_videos
    current_user.channel.load_videos
    redirect_to runs_select_videos_path
  end

  def create
    @run = Run.create(user: current_user, state: "editing")

    run_params[:videos_id].each do |vid_id|
      @run.videos << Video.find(vid_id)
    end

    @run.generate_blocks

    redirect_to runs_edit_descriptions_path(@run)
  end

  def update
    @run = Run.find(params[:id])
    @run.update(edit_descriptions_params)
    
    redirect_to runs_publish_changes_path(@run)
  end

  private

  def edit_descriptions_params
    params.require(:run).permit(blocks_attributes: [:id, :edited_content])
  end

  def run_params
    params.require(:run).permit(:videos_id => [])
  end

  def set_videos
    @videos = current_user.channel.videos
  end

end
