# Be sure to restart your server when you modify this file.

#IconHaiku::Application.config.session_store :cookie_store, key: '_IconHaiku_session'
IconHaiku::Application.config.session_store ActionDispatch::Session::CacheStore, :expire_after => 20.minutes

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# IconHaiku::Application.config.session_store :active_record_store
