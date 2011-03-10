$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'spec'

class Something
end
class Another
end
class MoreThanOneWord
end

class Find


  def Find.class_name_from this_sentence
    joined_together capitalised( words_from this_sentence )
  end
  def Find.class_for something
    Kernel.const_get ( class_name_from something )
  end

  def Find.joined_together words
    words.inject :+
  end

  def Find.words_from sentence
   sentence.split(" ")
  end

  def Find.capitalised words
    words.collect { |word | word.capitalize }
  end
end
  
describe "Something" do

  it "finds a class for a thing" do
    the_thing_we_found = Find.class_for "Something"
    the_thing_we_found.should == Something  
  end

  it "finds a class for another" do
    the_thing_we_found = Find.class_for "Another"
    the_thing_we_found.should == Another
  end

  it "finds a class with more than one word" do
    the_thing_we_found = Find.class_for "more than one word"
    the_thing_we_found.should == MoreThanOneWord
  end

end
