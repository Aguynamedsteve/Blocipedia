module ApplicationHelper
  def markdown(text)
<<<<<<< HEAD
  renderer = Redcarpet::Render::HTML.new
  extensions = {
    fenced_code_blocks: true,
    tables: true,
    autolink: true,
    strikethrough: true,
    underline: true,
    highlight: true,
    quote: true
  }
  redcarpet = Redcarpet::Markdown.new(renderer, extensions)
  (redcarpet.render text).html_safe
=======
    renderer = Redcarpet::Render::HTML.new
    extensions = {
      fenced_code_blocks: true,
      tables: true,
      autolink: true,
      strikethrough: true,
      underline: true,
      highlight: true,
      quote: true
    }
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
>>>>>>> collabo
  end
end
