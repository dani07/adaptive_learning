# adaptive-learning

An adaptive learning portal app for students to practice questions relevant to
an exam.

# Ruby version

 * Ruby  2.5.1
 * Rails 5.0.7

# Usage

 * bundle install
 * rake db:create
 * rake db:migrate
 * rake db:seed

# API

 * GET /users/summary - to get the current_user's summary
 * GET /questions/question - to get a random question
 * POST /questions/1/answer - to answer a particular question
