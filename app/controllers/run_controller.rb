class RunController < ApplicationController
  def select_videos
    set_videos
  end

  def edit_descriptions
    set_videos
  end

  def publish_changes
    set_videos
    set_blocks
  end

  private

  def set_videos
    @videos = [
      {
        title: "My last great video title is here and is a little long",
        description: "The description of my last video is pretty long so i can see what it looks like on two lines my nigga cheri",
        edited_description: "The description of my last video is pretty long so i can see what it looks like on two lines my nigga cheri more word"
      },
      {
        title: "My last great video title is here and is a little long",
        description: "The description of my last video is pretty long so i can see what it looks like on two lines my nigga cheri",
        edited_description: "The description of my last video is pretty long so i can see what it looks like on two lines"
      },
      {
        title: "My last great video title is here and is a little long",
        description: "The description of my last video is pretty long so i can see what it looks like on two lines my nigga cheri\n",
        edited_description: "The description of my last video is pretty long so i can see what it looks like on two lines my nigga cheri\nBonjour"
      },
      {
        title: "My last great video title is here and is a little long",
        description: "The description of my last video is pretty long so i can see what it looks like on two lines my nigga cheri",
        edited_description: "The description of my last video is pretty long so i can see what it looks like on two lines my nigga cheri"
      },
      {
        title: "My last great video title is here and is a little long",
        description: "The description of my last video is pretty long so i can see what it looks like on two lines my nigga cheri",
        edited_description: "The description of my last video is pretty long so i can see what it looks like on two lines my nigga cheri"
      },
      {
        title: "My last great video title is here and is a little long",
        description: "The description of my last video is pretty long so i can see what it looks like on two lines my nigga cheri",
        edited_description: "The description of my last video is pretty long so i can see what it looks like on two lines my nigga cheri"
      },
      {
        title: "My last great video title is here and is a little long",
        description: "The description of my last video is pretty long so i can see what it looks like on two lines my nigga cheri",
        edited_description: "The description of my last video is pretty long so i can see what it looks like on two lines my nigga cheri"
      },
      {
        title: "My last great video title is here and is a little long",
        description: "The description of my last video is pretty long so i can see what it looks like on two lines my nigga cheri",
        edited_description: "The description of my last video is pretty long so i can see what it looks like on two lines my nigga cheri"
      },
      {
        title: "My last great video title is here and is a little long",
        description: "The description of my last video is pretty long so i can see what it looks like on two lines my nigga cheri",
        edited_description: "The description of my last video is pretty long so i can see what it looks like on two lines my nigga cheri"
      }
    ]
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
