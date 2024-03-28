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
Review.destroy_all
Bookmark.destroy_all
Profile.destroy_all
Resource.destroy_all
Chatroom.destroy_all
User.destroy_all

puts "Creating users..."
user_Julia = User.create!(email: "julia@lewagon.com", password: "xxx111")
user_Albert = User.create!(email: "albert@lewagon.com", password: "xxx222")
user_Bridget = User.create!(email: "bridget@lewagon.com", password: "xxx333")
user_Thomas = User.create!(email: "thomas@lewagon.com", password: "xxx444")
user_Vivien = User.create!(email: "vivien@lewagon.com", password: "xxx555")
puts "Users created"


puts "Creating profiles..."
profile_Julia = Profile.create!(user: user_Julia,
  first_name: "Julia",
  last_name: "Hernandez",
  description: "My name is Julia, I'm a passionate teacher for grades 5-12 and have been working
  in several schools for the last 10 years. I believe that we teachers have to support each other much more,
  e.g. for creating teaching material and in pedagogical questions. Let's network!",
   )
profile_Albert = Profile.create!(user: user_Albert, first_name: "Albert", last_name: "Einstein", description: "Hi everyone, Albert here. I'm a total Math nerd and have been teaching Math for many years now. So if there are any Math questions coming up, I'm your guy :) Other subjects like Computing are interesting as well, but Math rules!")
profile_Bridget = Profile.create!(user: user_Bridget, first_name: "Bridget", last_name: "Jones", description: "As a junior teacher and young mother, I have to admit that I am sometimes overwhelmed with all the material I have to prepare for classes. Thank God I found TeachSmart and thank you everyone for sharing your teaching resources!")
profile_Thomas = Profile.create!(user: user_Thomas, first_name: "Thomas", last_name: "Jones", description: "My name is Thomas, but everyone calls me Teacher Tom. I have been teaching kids for a correspondence school for some time now and had to master many pedagogical challenges by only working remote and seeing my students on screens only. Happy to connect with you (online again, haha) and share insights into how you all manage everyday teacher life :)")
profile_Vivien = Profile.create!(user: user_Vivien, first_name: "Vivien", last_name: "Smith", description: "Hi fellow teachers, I'm Viv (short for Vivien). I'm kind of new here and am happy for any helpful hints and ideas on how to create some creative lessons for my students.")
puts "Profiles created"

# puts "Creating profile pictures..."
# file_path_julia = Rails.root.join('db', 'seeds', 'images', 'Julia.jpg')
# profile_Julia.photo.attach(io: File.open(file_path_julia), filename: 'Julia.jpg')

# file_path_albert = Rails.root.join('db', 'seeds', 'images', 'Albert.jpg')
# profile_Albert.photo.attach(io: File.open(file_path_albert), filename: 'Albert.jpg')

# file_path_bridget = Rails.root.join('db', 'seeds', 'images', 'Bridget.jpg')
# profile_Bridget.photo.attach(io: File.open(file_path_bridget), filename: 'Bridget.jpg')

# file_path_thomas = Rails.root.join('db', 'seeds', 'images', 'Thomas.jpg')
# profile_Thomas.photo.attach(io: File.open(file_path_thomas), filename: 'Thomas.jpg')

# file_path_vivien = Rails.root.join('db', 'seeds', 'images', 'Vivien.jpg')
# profile_Vivien.photo.attach(io: File.open(file_path_vivien), filename: 'Vivien.jpg')
# puts "Profile pictures created"

# puts "Creating profile pictures..."
require "open-uri"

def download_image_from_cloudinary(url)
  URI.open(url)
end

# Define a method to attach an image from Cloudinary to a resource
def attach_image_to_profile(profile, image_url)
  file = download_image_from_cloudinary(image_url)
  profile.photo.attach(io: file, filename: File.basename(image_url))
end

# Cloudinary URLs for the images
user_photos = {
  "Julia" => "https://res.cloudinary.com/di9zm7azt/image/upload/v1710754759/Julia_wuggdq.jpg",
  "Albert" => "https://res.cloudinary.com/di9zm7azt/image/upload/v1710754759/Albert_x3hzbs.jpg",
  "Bridget" => "https://res.cloudinary.com/di9zm7azt/image/upload/v1710754758/Bridget_er19e1.jpg",
  "Thomas" => "https://res.cloudinary.com/di9zm7azt/image/upload/v1710754762/Thomas_p9hjkd.jpg",
  "Vivien" => "https://res.cloudinary.com/di9zm7azt/image/upload/v1710754763/Vivien_vz2saw.jpg"
}

Profile.all.each do |profile|
  # Find the subject of the resource
  name = profile.first_name

  # Get the image URL corresponding to the subject
  image_url = user_photos[name]

  # Attach the image to the resource
  attach_image_to_profile(profile, image_url)
end

puts "Profile pictures created"

puts "Creating chatrooms..."

User.find_each do |user|
  Chatroom.create!(name: user.email.split('@').first.capitalize, user: user) unless user.chatroom
end

#chat_Julia = Chatroom.create!(name: "Julia", user: user_Julia)
#chat_Albert = Chatroom.create!(name: "Albert", user: user_Albert)
#chat_Bridget = Chatroom.create!(name: "Bridget", user: user_Bridget)
#chat_Thomas = Chatroom.create!(name: "Thomas", user: user_Thomas)
#chat_Vivien = Chatroom.create!(name: "Vivien", user: user_Vivien)
puts "Chatrooms created"

puts "Creating resources..."
resource_basic_algebra = Resource.create!(title: "Basic Algebra", description: "Lots of practice of solving equations from simple to quite complex", subject: "Mathematics", student_age: 11, category: "Algebra", resource_type: "Worksheet", user: user_Julia)
resource_past_tense = Resource.create!(title: "Past Tense", description: "Past tenses in German", subject: "German", student_age: 12, category: "Grammar", resource_type: "Worksheet", user: user_Julia)
resource_states = Resource.create!(title: "States", description: "Map of USA showing states", subject: "Geography", student_age: 14, category: "Political geography", resource_type: "Slides", user: user_Thomas)
resource_presentation = Resource.create!(title: "The Visible Spectrum", description: "Great resource for physics teachers", subject: "Physics", student_age: 14, category: "Light", resource_type: "Slides", user: user_Julia)
resource_formal_letters = Resource.create!(title: "Writing Formal Letters", description: "Introduction to using formal style in letter writing", subject: "English", student_age: 15, category: "Practice", resource_type: "Worksheet", user: user_Julia)
resource_fractions_and_decimals = Resource.create!(title: "Fractions and Decimals", description: "Practice in converting fractions and decimals to their equivalents", subject: "Mathematics", student_age: 12, category: "practice", resource_type: "Worksheet", user: user_Julia)
resource_charts_and_graphs = Resource.create!(title: "Charts and Graphs", description: "How to use charts and graphs to display numerical data", subject: "Mathematics", student_age: 13, category: "statistics", resource_type: "Slides", user: user_Thomas)
resource_hydrological_cycle = Resource.create!(title: "Rain in the UK", description: "Causes of local rain patterns", subject: "Geography", student_age: 12, category: "Meteorology", resource_type: "Video", user: user_Bridget)
resource_relational_databases = Resource.create!(title: "SQL Commands", description: "Learners explore increasingly challenging SQL commands", subject: "Computing", student_age: 15, category: "Databases", resource_type: "Worksheet", user: user_Julia)
resource_early_history = Resource.create!(title: "The Romans", description: "Everyday life in ancient Rome", subject: "History", student_age: 13, category: "Early history", resource_type: "Video", user: user_Albert)
resource_add_decimals = Resource.create!(title: "Add decimals", description: "Common fractions and decimals, adding decimals (tenths and hundredths)", subject: "Mathematics", student_age: 11, category: "Decimals", resource_type: "Slides", user: user_Albert)
resource_fractions = Resource.create!(title: "Add and subtract fractions", description: "Adding and subtracting fractions with unlike denominators", subject: "Mathematics", student_age: 11, category: "Fractions", resource_type: "Worksheet", user: user_Julia)
resource_multi_digit_multiplication = Resource.create!(title: "Multi-digit multiplication", description: "Practice in multiplying three digit numbers by two digit numbers", subject: "Mathematics", student_age: 11, category: "Multiplication", resource_type: "Worksheet", user: user_Albert)
resource_volumes = Resource.create!(title: "Calculating volumes", description: "Volume with unit cubes, rectangular prisms and volume word problems", subject: "Mathematics", student_age: 12, category: "Volumes", resource_type: "Worksheet", user: user_Vivien)
resource_converting_units = Resource.create!(title: "Converting units of measure", description: "Converting units of time, metric units and metric units word problems", subject: "Mathematics", student_age: 12, category: "Units", resource_type: "Slides", user: user_Julia)
resource_rounding = Resource.create!(title: "Rounding", description: "Rounding to whole numbers, decimal places, nearest ten, hundred and significant figure", subject: "Mathematics", student_age: 13, category: "Arithmetic", resource_type: "Slides", user: user_Thomas)
resource_complex_numbers = Resource.create!(title: "Complex numbers and quadratic equations", description: "Complex numbers of quadratic equations, algebraic properties of complex numbers and the square root of a complex number", subject: "Mathematics", student_age: 16, category: "Algebra", resource_type: "Practice", user: user_Thomas)
resource_linear_inequalities = Resource.create!(title: "Linear inequalities", description: "Algebraic solutions of linear inequalities in one variable, graphical solution of linear inequalities in two variables", subject: "Mathematics", student_age: 16, category: "Inequalities", resource_type: "Worksheet", user: user_Vivien)
resource_binomial_theorem = Resource.create!(title: "Binomial Theorem", description: "Statement and proof for positive integral indices, Pascal’s triangle and Binomial Expansion", subject: "Mathematics", student_age: 16, category: "Algebra", resource_type: "Practice", user: user_Thomas)
resource_derivatives = Resource.create!(title: "Limits and derivatives", description: "Definition of derivative and relation to the scope of the tangent of the curve", subject: "Mathematics", student_age: 16, category: "Calculus", resource_type: "Practice", user: user_Bridget)
resource_essentials_scratch = Resource.create!(title: "Programming essentials in Scratch", description: "Sequence and variables, operators and count-controlled iteration", subject: "Computing", student_age: 15, category: "Scratch", resource_type: "Worksheet", user: user_Bridget)
resource_modeling_data = Resource.create!(title: "Modelling data using spreadsheets", description: "Introduction to spreadsheets, quick calculations and collecting data", subject: "Computing", student_age: 16, category: "Spreadsheets", resource_type: "Practice", user: user_Thomas)
resource_relational_advances_scratch = Resource.create!(title: "Advanced programming in Scratch", description: "Subroutines, condition-controlled loops and creating lists", subject: "Computing", student_age: 15, category: "Scratch", resource_type: "Slides", user: user_Albert)
resource_computer_networks = Resource.create!(title: "Computer networks", description: "Computer networks and protocols, networking hardware, wired and wireless networks", subject: "Computing", student_age: 15, category: "Computing basics", resource_type: "Slides", user: user_Albert)
resource_vector_graphics = Resource.create!(title: "Media - Vector graphics", description: "Design graphics using vector graphic editing software, used to design anything from logos and icons to posters, board games, and complex illustrations", subject: "Computing", student_age: 17, category: "Graphics", resource_type: "Worksheet", user: user_Julia)
resource_python = Resource.create!(title: "Introduction to Python programming", description: "Basic introduction to different data types in Python", subject: "Computing", student_age: 16, category: "Python", resource_type: "Slides", user: user_Julia)
resource_data_science = Resource.create!(title: "Introduction to data science", description: "A brief introduction to the concept of variables in data science", subject: "Computing", student_age: 17, category: "Data Science", resource_type: "Practice", user: user_Bridget)
resource_relational_cybersecurity = Resource.create!(title: "Introduction to Cybersecurity", description: "Basic introduction, privacy policies and Social Engineering", subject: "Computing", student_age: 15, category: "Cybersecurity", resource_type: "Worksheet", user: user_Vivien)
resource_creating_media = Resource.create!(title: "Creating media", description: "Creating templates, layouts and edited media", subject: "Computing", student_age: 14, category: "Media", resource_type: "Slides", user: user_Thomas)
puts "Resources created"


# puts "Attaching resource images"
# file_path_maths = Rails.root.join('db', 'seeds', 'images', 'laptop_math.png')
# resource_basic_algebra.photos.attach(io: File.open(file_path_maths), filename: 'laptop_math.png')
# resource_fractions_and_decimals.photos.attach(io: File.open(file_path_maths), filename: 'laptop_math.png')
# resource_charts_and_graphs.photos.attach(io: File.open(file_path_maths), filename: 'laptop_math.png')
# resource_add_decimals.photos.attach(io: File.open(file_path_maths), filename: 'laptop_math.png')
# resource_fractions.photos.attach(io: File.open(file_path_maths), filename: 'laptop_math.png')
# resource_multi_digit_multiplication.photos.attach(io: File.open(file_path_maths), filename: 'laptop_math.png')
# resource_volumes.photos.attach(io: File.open(file_path_maths), filename: 'laptop_math.png')
# resource_converting_units.photos.attach(io: File.open(file_path_maths), filename: 'laptop_math.png')
# resource_unknown_variable.photos.attach(io: File.open(file_path_maths), filename: 'laptop_math.png')
# resource_complex_numbers.photos.attach(io: File.open(file_path_maths), filename: 'laptop_math.png')
# resource_binomial_theorem.photos.attach(io: File.open(file_path_maths), filename: 'laptop_math.png')
# resource_derivatives.photos.attach(io: File.open(file_path_maths), filename: 'laptop_math.png')
# resource_linear_inequalities.photos.attach(io: File.open(file_path_maths), filename: 'laptop_math.png')

# file_path_computing = Rails.root.join('db', 'seeds', 'images', 'laptop_computing.png')
# resource_essentials_scratch.photos.attach(io: File.open(file_path_computing), filename: 'laptop_computing.png')
# resource_modeling_data.photos.attach(io: File.open(file_path_computing), filename: 'laptop_computing.png')
# resource_relational_advances_scratch.photos.attach(io: File.open(file_path_computing), filename: 'laptop_computing.png')
# resource_computer_networks.photos.attach(io: File.open(file_path_computing), filename: 'laptop_computing.png')
# resource_vector_graphics.photos.attach(io: File.open(file_path_computing), filename: 'laptop_computing.png')
# resource_python.photos.attach(io: File.open(file_path_computing), filename: 'laptop_computing.png')
# resource_data_science.photos.attach(io: File.open(file_path_computing), filename: 'laptop_computing.png')
# resource_relational_cybersecurity.photos.attach(io: File.open(file_path_computing), filename: 'laptop_computing.png')
# resource_creating_media.photos.attach(io: File.open(file_path_computing), filename: 'laptop_computing.png')
# resource_relational_databases.photos.attach(io: File.open(file_path_computing), filename: 'laptop_computing.png')

# file_path_german = Rails.root.join('db', 'seeds', 'images', 'laptop_ger.png')
# resource_past_tense.photos.attach(io: File.open(file_path_german), filename: 'laptop_ger.png')

# file_path_geography = Rails.root.join('db', 'seeds', 'images', 'laptop_geo.png')
# resource_states.photos.attach(io: File.open(file_path_geography), filename: 'laptop_geo.png')
# resource_hydrological_cycle.photos.attach(io: File.open(file_path_geography), filename: 'laptop_geo.png')

# file_path_physics = Rails.root.join('db', 'seeds', 'images', 'laptop_phy.png')
# resource_presentation.photos.attach(io: File.open(file_path_physics), filename: 'laptop_phy.png')

# file_path_english = Rails.root.join('db', 'seeds', 'images', 'laptop_eng.png')
# resource_formal_letters.photos.attach(io: File.open(file_path_english), filename: 'laptop_eng.png')

# file_path_history = Rails.root.join('db', 'seeds', 'images', 'laptop_his.png')
# resource_early_history.photos.attach(io: File.open(file_path_history), filename: 'laptop_his.png')
# puts "Images attached"

puts "Creating images..."

require "open-uri"
# Define a method to download images from Cloudinary
def download_image_from_cloudinary(url)
  URI.open(url)
end

# Define a method to attach an image from Cloudinary to a resource
def attach_image_to_resource(resource, image_url)
  file = download_image_from_cloudinary(image_url)
  resource.photos.attach(io: file, filename: File.basename(image_url))
end

# Define a hash containing subject names as keys and corresponding image URLs as values
subject_image_urls = {
  "History" => "https://res.cloudinary.com/di9zm7azt/image/upload/v1711396838/development/laptop_his_btsqcl.png",
  "Mathematics" => "https://res.cloudinary.com/di9zm7azt/image/upload/v1711396842/development/laptop_math_shbk08.png",
  "Geography" => "https://res.cloudinary.com/di9zm7azt/image/upload/v1711396833/development/laptop_geo_vcactc.png",
  "German" => "https://res.cloudinary.com/di9zm7azt/image/upload/v1711396836/development/laptop_ger_saflr9.png",
  "English" => "https://res.cloudinary.com/di9zm7azt/image/upload/v1711396831/development/laptop_eng_pukwkr.png",
  "Computing" => "https://res.cloudinary.com/di9zm7azt/image/upload/v1711396827/development/laptop_computing_n3dwc6.png",
  "Physics" => "https://res.cloudinary.com/di9zm7azt/image/upload/v1711396847/development/laptop_phy_dpjlsb.png"
}

puts "Attaching resource images..."

# Iterate through each resource and attach the corresponding image
Resource.all.each do |resource|
  # Find the subject of the resource
  subject = resource.subject

  # Get the image URL corresponding to the subject
  image_url = subject_image_urls[subject]

  # Attach the image to the resource
  attach_image_to_resource(resource, image_url)
end

puts "Images attached to resources"

puts "Creating reviews..."
review_algebra_first = Review.create!(rating: 4, content: "Well-designed with right amount of challenge", resource: resource_basic_algebra, user: user_Albert)
review_algebra_second = Review.create!(rating: 2, content: "Too hard for my students", resource: resource_basic_algebra, user: user_Bridget)
review_algebra_third = Review.create!(rating: 4, content: "Just what I needed at the time", resource: resource_basic_algebra, user: user_Thomas)
review_past_first = Review.create!(rating: 5, content: "Really brings the subject to life!", resource: resource_past_tense, user: user_Vivien)
review_past_second = Review.create!(rating: 3, content: "Supplements regular coursebook", resource: resource_past_tense, user: user_Albert)
review_states_first = Review.create!(rating: 4, content: "Very informative. Students enjoyed it!", resource: resource_states, user: user_Bridget)
review_states_second = Review.create!(rating: 5, content: "Really got their attention", resource: resource_states, user: user_Thomas)
review_states_third = Review.create!(rating: 4, content: "Thoroughly recommended!", resource: resource_states, user:user_Vivien)
review_spectrum_first = Review.create!(rating: 3, content: "Quite helpful", resource: resource_presentation, user: user_Albert)
review_spectrum_second = Review.create!(rating: 3, content: "Gives basic information on topic", resource: resource_presentation, user: user_Bridget)
review_letters_first = Review.create!(rating: 4, content: "Lively introduction to what can be a dry subject", resource: resource_formal_letters, user: user_Thomas)
review_letters_second = Review.create!(rating: 4, content: "Very helpful!", resource: resource_formal_letters, user: user_Vivien)
review_letters_third = Review.create!(rating: 1, content: "Students were bored", resource: resource_formal_letters, user: user_Albert)
review_fractions_first = Review.create!(rating: 4, content: "Just the right level for my students", resource: resource_fractions_and_decimals, user: user_Bridget)
review_fractions_second = Review.create!(rating: 4, content: "A very helpful resource. Glad I downloaded it", resource: resource_fractions_and_decimals, user: user_Thomas)
review_fractions_third = Review.create!(rating: 3, content: "Adequate!", resource: resource_fractions_and_decimals, user: user_Vivien)
review_charts_first = Review.create!(rating: 5, content: "Essential points presented well", resource: resource_charts_and_graphs, user: user_Albert)
review_charts_second = Review.create!(rating: 3, content: "A little advanced for my students", resource: resource_charts_and_graphs, user: user_Bridget)
review_hydrological_first = Review.create!(rating: 4, content: "Very interesting video!", resource: resource_hydrological_cycle, user: user_Thomas)
review_hydrological_second = Review.create!(rating: 3, content: "More detail needed", resource: resource_hydrological_cycle, user: user_Vivien)
review_hydrological_third = Review.create!(rating: 4, content: "Just the right level", resource: resource_hydrological_cycle, user: user_Albert)
review_database_first = Review.create!(rating: 3, content: "Very steep progression of difficulty", resource: resource_relational_databases, user: user_Bridget)
review_database_second = Review.create!(rating: 2, content: "Often confusing for students", resource: resource_relational_databases, user: user_Thomas)
review_romans_first = Review.create!(rating: 5, content: "Students were fascinated by the video", resource: resource_early_history, user: user_Vivien)
review_romans_second = Review.create!(rating: 5, content: "Lots of surprising information", resource: resource_early_history, user: user_Albert)
review_romans_third = Review.create!(rating: 4, content: "A nice introduction to build on", resource: resource_early_history, user: user_Bridget)

puts "Reviews created"
puts "Seeding finished"
