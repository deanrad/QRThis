# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_QRThis_session',
  :secret      => '65e261f7253aa32c1e0c38478167d1c206a883cf28640e51589994c93be322646fd2c937fd87fd2f0b408ad867d1069f212d58a3e5b0c50a74e768b91b607009'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
