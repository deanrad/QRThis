# General step to call up a saved instance of any number of our classes
Given /^a (user|qrcode|template|slogan|product)$/ do |model|
  instance_variable_set( "@#{model}", eval(model.classify).first )
end

Given /^their text "(.*?)"$/ do |slogan_text|
  @slogan_text = slogan_text
  @slogan = Slogan.new(:text => @slogan_text)
end

Given /^the default set of system data$/ do 
  models = %w(products qrcodes merges templates)
  Fixtures.create_fixtures("test/fixtures", models )
  models.each do |m|
    klass = m.singularize.classify.constantize
    c = klass.send(:count)
    $stderr.puts "#{c} #{m} in db"
    
    first_one = m.singularize.classify.constantize.send(:first)
    instance_variable_set "@#{m.singularize}", first_one
  end
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