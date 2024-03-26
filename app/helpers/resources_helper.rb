module ResourcesHelper
  def image_for_subject(subject)
    {
      "History" => "https://res.cloudinary.com/di9zm7azt/image/upload/v1711396838/development/laptop_his_btsqcl.png",
      "Mathematics" => "https://res.cloudinary.com/di9zm7azt/image/upload/v1711396842/development/laptop_math_shbk08.png",
      "Geography" => "https://res.cloudinary.com/di9zm7azt/image/upload/v1711396833/development/laptop_geo_vcactc.png",
      "German" => "https://res.cloudinary.com/di9zm7azt/image/upload/v1711396836/development/laptop_ger_saflr9.png",
      "English" => "https://res.cloudinary.com/di9zm7azt/image/upload/v1711396831/development/laptop_eng_pukwkr.png",
      "Computing" => "https://res.cloudinary.com/di9zm7azt/image/upload/v1711396827/development/laptop_computing_n3dwc6.png",
      "Physics" => "https://res.cloudinary.com/di9zm7azt/image/upload/v1711396847/development/laptop_phy_dpjlsb.png"
    } [subject] || "https://res.cloudinary.com/di9zm7azt/image/upload/v1711396842/development/laptop_math_shbk08.png"
  end
end
