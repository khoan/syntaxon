class View::Homepage
  View['homepage'] = self

  def initialize args={}
  end

  def themes
    Rouge::Theme.registry.keys
  end

  def languages
    Rouge::Lexer.send(:registry).keys
  end
end
