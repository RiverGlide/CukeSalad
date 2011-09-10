require 'sinatra/base'
require 'erb'

$:.unshift(File.dirname(__FILE__), '.')
require 'calculator'

Sinatra::Base.enable :inline_templates

class WebCalculator < Sinatra::Base

  use Rack::Session::Pool

  configure :development, :test do
      require 'sinatra/reloader'
  end

  helpers do
    def operate_with
      { 'plus' => :+, 'minus' => :-}
    end

    def persist calc
      session[:calc] = calc
    end

    def display_result_from calc
      @display = calc.display
      @operations = operate_with
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
      @operations = operate_with
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
