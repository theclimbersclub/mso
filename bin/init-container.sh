#
# Add any setup tasks for your devcontainer here
#
bundle install
rails db:setup
rails db:migrate
