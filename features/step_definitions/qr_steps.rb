Given /^a (.*) available through a vendor$/ do | product |
  @product = Slogan.new
end

Given /^this shirt has (.*) options$/ do |opts|
  puts "Hey maria - your shirt will be made with #{opts}"
  pending # express the regexp above with the code you wish you had
end

Given /^a user that wants to see more information about a (.*)$/ do |product|
  puts "User buying: #{product}"
  # @user = User.first
  # @product = TShirt.first
end

Then /^a user should be able to see available colors$/ do
  @product.avaiable_colors.length.should > 0
end



