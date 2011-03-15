$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'bundler'
require 'researcher'
Bundler.setup

class Director

  def initialize
    @researcher = Researcher.new
  end

  def how_do_i_perform this_thing, *with_details
    directives = @researcher.get_directives_for( this_thing )
    too_many_arguments if (we_dont_need_details_for?(directives) && we_were_called?( with_details ))
    too_few_arguments  if (we_need_details_for?(directives) &&  we_were_not_called?( with_details ))

    directives.new *with_details
  end

  def we_were_called? with_something
    !we_were_not_called? with_something
  end
  
  def we_were_not_called? with_something
    with_something.empty?
  end

  def we_dont_need_details_for? with_something
     !we_need_details_for? with_something
  end

  def we_need_details_for? with_something
     with_something.instance_method(:initialize).arity > 0 
  end

  def too_many_arguments
    raise TooMuchInformationComplaint, "It looks like you are trying to give information to a task that doesn't need it"
  end

  def too_few_arguments
    raise INeedMoreInformationComplaint, "It looks like you are trying to use a task that needs information, but you haven't specified it"
  end
end

class INeedMoreInformationComplaint < Exception
end

class TooMuchInformationComplaint < Exception
end
