class RunsController < ApplicationController
  before_action :authenticate_user!

  def select_videos
    current_user.load_videos if current_user.channel.videos.empty?

    @videos = current_user.channel.videos
    @run = Run.new
  end

  def edit_descriptions
    @run = Run.where(state: "editing").last
  end

  def publish_changes
    @run = Run.where(state: "editing").last
    @run.calculate_cost
  end

  def create
    @run = Run.create(user: current_user, state: "editing")

    run_params[:videos_id].each do |vid_id|
      @run.videos << Video.find(vid_id)
    end

    @run.generate_blocks
    redirect_to runs_edit_descriptions_path
  end

  def update
    params.require(:run)
    @run = Run.find(params[:id])

    params[:run].each do |block_update|
      block = Block.find(block_update[0])
      block.update(edited_content: block_update[1][0])
    end

    redirect_to runs_publish_changes_path
  end

  private

  def run_params
    params.require(:run).permit(:videos_id => [])
  end

  def set_videos
    @videos = current_user.channel.videos
  end

end
