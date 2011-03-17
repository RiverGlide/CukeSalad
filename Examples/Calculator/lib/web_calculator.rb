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

    def persist calc
      session[:calc] = calc
    end

    def display_result_from calc
      @display = calc.display
      erb :index
    end

    def user_input
      params[:number].to_i
    end

    def selected_operator
      params[:operator]
    end

    def display_result_from_session
      @display = session[:calc].display ||= 0
      erb :index
    end

    def input_entered?
      not params[:number].empty?
    end

    def equals_pressed?
      selected_operator == "equals"
    end

    def load_calculator
      session[:calc] ||= Calculator.new
    end
  
  end

  get '/' do
    load_calculator
    display_result_from_session
  end

  post '/' do
    calculator = load_calculator 
    calculator.enter user_input if input_entered?
    if equals_pressed?
      calculator.equals
    else
      calculator.get_ready_to operate_with[selected_operator]
    end
    persist calculator
    display_result_from calculator
  end
end

__END__
@@ layout
<h1>Calculator is Ready!</h1>
<%= yield %>

@@ index
<form method="POST" action="/">
  <input type="text" disabled name="display" id="display" value="<%=@display %>" />
  <input type="text" name="number" id="number" />
  <input type="submit" name="operator" id="minus" text="-" value="minus" />
  <input type="submit" name="operator" id="plus" text="+" value="plus" />
  <input type="submit" name="operator" id="equals" text="=" value="equals" />
</form>
