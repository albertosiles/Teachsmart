# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Resource.destroy_all
User.destroy_all
puts "Creating users..."
puts "seeding..."
user_Julia = User.create!(email: "julia@lewagon.com", password: "xxx111")
user_Robert = User.create!(email: "robert@lewagon.com", password: "xxx222")
user_Bridget = User.create!(email: "bridget@lewagon.com", password: "xxx333")
user_Thomas = User.create!(email: "thomas@lewagon.com", password: "xxx444")
user_Vivien = User.create!(email: "vivien@lewagon.com", password: "xxx555")
puts "Creating resources..."
puts "seeding"
resource_basic_algebra = Resource.create!(title: "Basic Algebra", description: "Introduction to simple equations", subject: "Mathematics", student_age: 11, category: "Algebra", resource_type: "Worksheets", user: user_Julia, resource_url: "public/resources/files/simple_algebra_practice.pdf")
resource_past_tense = Resource.create!(title: "Past Tense", description: "Past tenses in German", subject: "German", student_age: 12, category: "Grammar", resource_type: "Worksheet", user: user_Julia)
resource_states = Resource.create!(title: "States", description: "Map of USA showing states", subject: "Geography", student_age: 14, category: "Political geography", resource_type: "Slides", user: user_Julia)
resource_presentation = Resource.create!(title: "The Visible Spectrum", description: "Great resource for physics teachers", subject: "Physics", student_age: 14, category: "Light", resource_type: "Slides", user: user_Julia)
resource_formal_letters = Resource.create!(title: "Writing Formal Letters", description: "Introduction to using formal style in letter writing", subject: "English", student_age: 15, category: "practice", resource_type: "Worksheets", user: user_Julia)
resource_fractions_and_decimals = Resource.create!(title: "Fractions and Decimals", description: "Lots of practice exercises", subject: "Mathematics", student_age: 12, category: "practice", resource_type: "Slides", user: user_Julia)
resource_charts_and_graphs = Resource.create!(title: "Charts and Graphs", description: "How to use charts and graphs to display numerical data", subject: "Mathematics", student_age: 13, category: "statistics", resource_type: "Slides", user: user_Julia)
resource_hydrological_cycle = Resource.create!(title: "Rain in the UK", description: "Causes of local rain patterns", subject: "Geography", student_age: 12, category: "Meteorology", resource_type: "Video", user: user_Julia)
resource_relational_databases = Resource.create!(title: "SQL Commands", description: "Learners explore increasingly challenging SQL commands", subject: "Computing", student_age: 15, category: "Databases", resource_type: "Worksheets", user: user_Julia)
resource_early_history = Resource.create!(title: "The Romans", description: "Everyday life in ancient Rome", subject: "History", student_age: 13, category: "Early history", resource_type: "Video", user: user_Julia)

Review.destroy_all
puts "Creating reviews"
puts "seeding"
review_algebra_first = Review.create!(rating: 4, content: "Well-designed with right amount of challenge", resource: resource_basic_algebra, user: user_Robert)
review_algebra_second = Review.create!(rating: 2, content: "Too hard for my students", resource: resource_basic_algebra, user: user_Bridget)
review_algebra_third = Review.create!(rating: 4, content: "Just what I needed at the time", resource: resource_basic_algebra, user: user_Thomas)
review_past_first = Review.create!(rating: 5, content: "Really brings the subject to life!", resource: resource_past_tense, user: user_Vivien)
review_past_second = Review.create!(rating: 3, content: "Supplements regular coursebook", resource: resource_past_tense, user: user_Robert)
review_states_first = Review.create!(rating: 4, content: "Very informative. Students enjoyed it!", resource: resource_states, user: user_Bridget)
review_states_second = Review.create!(rating: 5, content: "Really got their attention", resource: resource_states, user: user_Thomas)
review_states_third = Review.create!(rating: 4, content: "Thoroughly recommended!", resource: resource_states, user:user_Vivien)
review_spectrum_first = Review.create!(rating: 3, content: "Quite helpful", resource: resource_presentation, user: user_Robert)
review_spectrum_second = Review.create!(rating: 3, content: "Gives basic information on topic", resource: resource_presentation, user: user_Bridget)
review_letters_first = Review.create!(rating: 4, content: "Lively introduction to what can be a dry subject", resource: resource_formal_letters, user: user_Thomas)
review_letters_second = Review.create!(rating: 4, content: "Very helpful!", resource: resource_formal_letters, user: user_Vivien)
review_letters_third = Review.create!(rating: 1, content: "Students were bored", resource: resource_formal_letters, user: user_Robert)
review_fractions_first = Review.create!(rating: 4, content: "Just the right level for my students", resource: resource_fractions_and_decimals, user: user_Bridget)
review_fractions_second = Review.create!(rating: 4, content: "A very helpful resource. Glad I downloaded it", resource: resource_fractions_and_decimals, user: user_Thomas)
review_fractions_third = Review.create!(rating: 3, content: "Adequate!", resource: resource_fractions_and_decimals, user: user_Vivien)
review_charts_first = Review.create!(rating: 5, content: "Essential points presented well", resource: resource_charts_and_graphs, user: user_Robert)
review_charts_second = Review.create!(rating: 3, content: "A little advanced for my students", resource: resource_charts_and_graphs, user: user_Bridget)
review_hydrological_first = Review.create!(rating: 4, content: "Very interesting video!", resource: resource_hydrological_cycle, user: user_Thomas)
review_hydrological_second = Review.create!(rating: 3, content: "More detail needed", resource: resource_hydrological_cycle, user: user_Vivien)
review_hydrological_third = Review.create!(rating: 4, content: "Just the right level", resource: resource_hydrological_cycle, user: user_Robert)
review_database_first = Review.create!(rating: 3, content: "Very steep progression of difficulty", resource: resource_relational_databases, user: user_Bridget)
review_database_second = Review.create!(rating: 2, content: "Often confusing for students", resource: resource_relational_databases, user: user_Thomas)
review_romans_first = Review.create!(rating: 5, content: "Students were fascinated by the video", resource: resource_early_history, user: user_Vivien)
review_romans_second = Review.create!(rating: 5, content: "Lots of surprising information", resource: resource_early_history, user: user_Robert)
review_romans_third = Review.create!(rating: 4, content: "A nice introduction to build on", resource: resource_early_history, user: user_Bridget)
