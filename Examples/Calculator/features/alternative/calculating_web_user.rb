# To run with this version of the Calculating Individual:
# cucumber -r features/roles/calculating_web_user.rb -r features/tasks/ -r features/support/env.rb -r features/*.feature<cr>
# TODO: Move this stuff to the readme

class Browser
  
  # This class will wrap Capybara or whatever browser driver we're using
  
  def go_to this_uri

  end

  def page
    response
  end
end

class CalculatingIndividual

  # Uses a Browser to perform its tasks

  def initialize 
    open_browser
    @browser.go_to '/calculator'
    @browser.page.should have_selector('title', :content => 'Calculator')
  end

  def open_browser 
    @browser ||= Browser.new
  end

  def enters value
  end
  
  def presses next_operator
  end

  def can_see 
    0
  end
end
