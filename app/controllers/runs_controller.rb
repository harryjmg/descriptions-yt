class RunsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_run, only: [:edit_descriptions, :publish_changes, :publish_changes_online, :done, :update]

  def select_videos
    current_user.channel.load_videos if current_user.channel.videos.empty?

    @videos = current_user.channel.videos
    @run = Run.new

    @step = 1
    render 'run'
  end

  def edit_descriptions
    @step = 2
    render 'run'
  end

  def publish_changes
    @run.calculate_cost
    @blocks = @run.select_modified_blocks

    @step = 3
    render 'run'
  end

  def publish_changes_online
    if @run.cost <= current_user.credit
      @run.push_youtube
      redirect_to runs_done_path
    else
      redirect_to credit_index_path
    end
  end

  def done
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
    @run.delete_false_blocks

    redirect_to runs_edit_descriptions_path(@run)
  end

  def update
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

  def set_run
    @run = current_user.runs.find(params[:id])
  end

end
