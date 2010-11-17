Feature: Ordering a QRcode product
  In order to make money selling products
  As a website owner 
  I want to enable people to buy our products

  # Scenario: Buying a T-shirt with a qrcode of a slogan
  # 	  Given a t-shirt available through a vendor
  # 	  Given this shirt has default options
  # 	  Then I should be able to put my slogan on the shirt in a qr code
  # 
  # Scenario: Buying a T-shirt with a qrcode of their facebook url's page
  #   Given a user that wants to create a t-shirt that links to their facebook's status
  #   Then a user should be able to enter their facebook user name
  Scenario: A user wants to encode a slogan on a t-shirt
    Given a user
    Given their text "FUCK MY HIGH SCHOOL"
		Then we should save their text
		And we can create a qrcode encoding that text
		
	Scenario: A user wants to embed their qrcode into a template
	  Given a qrcode
		And a template
		Then we should be able to create a merge of the qrcode and template

	# Scenario: Need more details about a T-shirt
	# 	Given a user that wants to see more information about a T-shirt
	# 	Then a user should be able to see price
	# 	And a user should be able to see available colors
	# 	And a user should be able to see available sizes
	# 	And a user should be able to see a larger image of the design
	# 
	# Scenario: Need to add T-shirt to their cart
	# 	Given a user that wants to buy a T-shirt
	# 	Then a user should be able to add a selected T-shirt to their cart on the detail page
	# 	And a user should be able to see that item in their cart on all pages of the website
	# 	And a user should be able to see that item in their cart for 30 days after it was added
	# 
	# Scenario: Need to remove a T-shirt to their cart
	# 	Given a user that wants to remove a T-shirt from their cart
	# 	Then a user should be able to select the T-shirt in their cart and delete it
	# 	And a user should be able to see the new contents of their cart
	# 	And a user should be optionally asked why they removed it with pre-filled reasons
	# 
	# Scenario: Need to see the contents of their shopping cart
	# 	Given a user that wants to see what they have in their shopping cart
	# 	Then a user should be able to select a link to their cart on all pages which opens their cart for display
	# 	And a user should be able select links to the items that are in the cart
	# 	And a user should be able to see the total cost of all their items (pre-shipping)
	# 
	# Scenario: Need to be able to personalize a QR code for a specific design
	# 	Given a user that wants to see to personalize a design
	# 	Then a user should be able to create a personalized QR code that merges into the specific design they selected
					 
				
				
