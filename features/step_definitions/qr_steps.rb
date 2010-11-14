Given /^a user$/ do
  @user = User.new
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
