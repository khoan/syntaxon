require 'bundler/setup'

require 'cuba'
require 'mote'
require 'rouge'

require_relative './view'
require_relative './lib/cuba'
require_relative './lib/syntax'

Cuba.define do
  on root do
    on get do
      render 'template/homepage.html', view: view('homepage')
    end

    on post do
      on accept 'application/json' do
        data = Syntax.on(req['src'], req['lang'], req['theme'])
        res.write JSON.fast_generate(data: data)
      end
    end
  end
end
