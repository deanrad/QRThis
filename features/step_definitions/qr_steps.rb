# General step to call up a saved instance of any number of our classes
Given /^a (user|qrcode|template|slogan)$/ do |model|
  instance_variable_set( "@#{model}", eval(model.classify).first )
end

Given /^their text "(.*?)"$/ do |slogan_text|
  @slogan_text = slogan_text
  @slogan = Slogan.new(:text => @slogan_text)
end

Then /^we should save their text$/ do
  @slogan.save!
  @slogan.text.should == @slogan_text
end

Then /^we can create a qrcode encoding that text$/ do
  @qrcode = @slogan.qrcodes.create_with_options( {} )
  @qrcode.id.should_not == nil
  @qrcode.contents.length.should > 1000
end

Then /create a merge/ do 
  @qrcode ||= Qrcode.first
  @template ||= Template.first
  
  @merge = @template.merge(@qrcode)
end