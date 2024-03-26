module ResourcesHelper
  def image_for_subject(subject)
    case subject
    when 'Mathematics' then 'laptop_math.png'
    when 'German' then 'laptop_ger.png'
    when 'Geography' then 'laptop_geo.png'
    when 'Physics' then 'laptop_phy.png'
    when 'English' then 'laptop_eng.png'
    when 'Computing' then 'laptop_computing.png'
    when 'History' then 'laptop_his.png'
    else 'laptop_class.png'
    end
  end
end
