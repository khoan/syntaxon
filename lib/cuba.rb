class Cuba
  def view name, options={}
    require_relative "../view/#{name}"
    View[name].new(options)
  end

  def render template_path, vars={}
    template = Mote.parse(IO.read(template_path), self, vars.keys)
    res.write template.call(vars)
  end
end
