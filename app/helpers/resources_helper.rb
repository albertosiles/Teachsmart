module ResourcesHelper
  def image_for_subject(subject)
    case subject
    when 'Mathematics' then 'math.jpg'
    when 'German' then 'language.jpg'
    when 'Geography' then 'geography.jpg'
    when 'Physics' then 'physics.jpg'
    when 'English' then 'english.jpg'
    when 'Computing' then 'computing.jpg'
    when 'History' then 'history.jpg'
    else 'classroom.jpg'
    end
  end
end
