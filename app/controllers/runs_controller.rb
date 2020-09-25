class RunsController < ApplicationController
  before_action :authenticate_user!

  def select_videos
    current_user.load_videos if current_user.channel.videos.empty?

    set_videos
    set_run
  end

  def edit_descriptions
    set_videos # Will be removed
    set_run

  end

  def publish_changes
    set_videos
    set_blocks
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
  end

  private

  def set_run
    @run = Run.where(state: "editing").last || Run.new
  end

  def run_params
    params.require(:run).permit(:videos_id => [])
  end

  def set_videos
    @videos = current_user.channel.videos
  end

  def set_blocks
    @blocks = [
      {
        content: "Je m'appelle Harry et j'adore le riz\nJ'aime aussi le fric\nJ'aime aussi les meufs\nLe dites pas à ma copine",
        edited_content: "Je m'appelle Harry et j'adore le riz\nJ'aime aussi le fric\nJ'aime aussi les nems"
      },
      {
        content: "Contactez moi\nSur facebook : lien fb\nSur mail : lien mail\n",
        edited_content: "Contactez moi\nSur facebook : lien fb\nSur mail : lien mail\nA new line"
      }
    ]
  end
end
