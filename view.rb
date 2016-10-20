class View
  @@registry = {}

  def self.[] name
    @@registry[name]
  end

  def self.[]= name, value
    @@registry[name] = value
  end
end
