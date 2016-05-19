module MarkdownHelper
  def markdown(raw)
    markdown_renderer.render(raw).html_safe
  end

  private

  def markdown_renderer
    @markdown_renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end
end
