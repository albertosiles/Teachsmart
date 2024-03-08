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
User.destroy_all
puts "Creating users..."
puts "seeding..."

user_Julia = User.create!(email: "julia@lewagon.com", password: "xxx111")
user_Robert = User.create!(email: "robert@lewagon.com", password: "xxx222")
user_Bridget = User.create!(email: "bridget@lewagon.com", password: "xxx333")
user_Thomas = User.create!(email: "thomas@lewagon.com", password: "xxx444")
user_Vivien = User.create!(email: "vivien@lewagon.com", password: "xxx555")

Resource.destroy_all
puts "Creating resources..."
puts "seeding"

resource_basic_algebra = Resource.create!(title: "Basic Algebra", description: "Introduction to simple equations", subject: "Mathematics", student_age: 11, category: "Algebra", resource_type: "Worksheets")
reource_past_tense = Resource.create!(title: "Past Tense", description: "Past tenses in German", subject: "German", student_age: 12, category: "Grammar", resource_type: "Worksheet")
resource_states = Resource.create!(title: "States", description: "Map of USA showing states", subject: "Geography", student_age: 14, category: "Political geography", resource_type: "Slides")
resource_presentation = Resource.create!(title: "The Visible Spectrum", description: "Great resource for physics teachers", subject: "Physics", student_age: 14, category: "Light", resource_type: "Slides")
resource_formal_letters = Resource.create!(title: "Writing Formal Letters", description: "Introduction to using formal style in letter writing", subject: "English", student_age: 15, category: "practice", resource_type: "Worksheets")
resource_fractions_and_decimals = Resource.create!(title: "Fractions and Decimals", description: "Lots of practice exercises", subject: "Mathematics", student_age: 12, category: "practice", resource_type: "Slides")
resource_charts_and_graphs = Resource.create!(title: "Charts and Graphs", description: "How to use charts and graphs to display numerical data", subject: "Mathematics", student_age: 13, category: "statistics", resource_type: "Slides")
resource_hydrological_cycle = Resource.create!(title: "Rain in the UK", description: "Causes of local rain patterns", subject: "Geography", student_age: 12, category: "Meteorology", resource_type: "Video")
resource_relational_databases = Resource.create!(title: "SQL Commands", description: "Learners explore increasingly challenging SQL commands", subject: "Computing", student_age: 15, category: "Databases", resource_type: "Worksheets")
resource_early_history = Resource.create!(title: "The Romans", description: "Everyday life in ancient Rome", subject: "History", student_age: 13, category: "Early history", resource_type: "Video")
