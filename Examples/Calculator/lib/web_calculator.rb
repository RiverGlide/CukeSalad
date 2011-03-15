require 'sinatra/base'
require 'erb'
$:.unshift(File.dirname(__FILE__), '.')
require 'calculator'

Sinatra::Base.enable :inline_templates
Sinatra::Base.enable :sessions

class WebCalculator < Sinatra::Base

  helpers do
    def operate_with
      { 'plus' => :+, 'minus' => :-}
    end

    def load_session_into calc
      calc.enter session[:display].to_i ||= 0
      calc.get_ready_to operate_with[session[:previous_operator]] if session[:previous_operator]
    end

    def persist_into_session calc
      session[:previous_operator] = params[:operator]
      session[:display] = calc.display
    end

    def display_result_from calc
      @display = calc.display
      erb :index
    end

    def user_input
      params[:display].to_i
    end

    def selected_operator
      params[:operator]
    end

    def display_result_from_session
      @display = session[:display] ||= 0
      erb :index
    end
  end

  get '/' do
    display_result_from_session
  end

  post '/' do
    calculator = Calculator.new
    load_session_into calculator
    calculator.enter user_input 
    calculator.get_ready_to operate_with[selected_operator]
    persist_into_session calculator
    display_result_from calculator
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
