class Syntax < Struct.new(:source, :language, :theme)
  def self.on source, language='html', theme='colorful'
    # TODO guess when language is not provided
    new(source, language, theme).highlight
  end

  def highlight
    Rouge.highlight(source, lexer, formatter)
  end

  private

  def formatter
    Rouge::Formatters::HTMLInline.new Rouge::Theme.find(theme).new
  end

  def lexer
    Rouge::Lexer.find(language.downcase).new
  end
end
