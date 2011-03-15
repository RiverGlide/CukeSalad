require 'sinatra/base'
require 'erb'
$:.unshift(File.dirname(__FILE__), '.')
require 'calculator'

Sinatra::Base.enable :inline_templates
Sinatra::Base.enable :sessions

class WebCalculator < Sinatra::Base

  helpers do
    def operate_with
      { :plus => :+, :minus => :- }
    end
  end

  get '/' do
    @display = session[:display] ||= 0
    erb :index
  end

  post '/' do
    puts params.inspect
    calc = Calculator.new
    @display = params[:display]
    calc.enter @display
    calc.get_ready_to operate_with[params[:operator]]
    @display = calc.display
    session[:display] = @display
    erb :index
  end
end

__END__
@@ layout
<h1>Calculator is Ready!</h1>
<%= yield %>

@@ index
<form method="POST" action="/">
  <input type="text" name="display" id="display" value="<%=@display %>" />
  <input type="submit" name="operator" id="minus" text="-" value="minus" />
  <input type="submit" name="operator" id="plus" text="+" value="plus" />
  <input type="submit" name="equals" id="equals" text="=" value="equals" />
</form>
