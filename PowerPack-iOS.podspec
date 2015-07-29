#
# Be sure to run `pod lib lint PowerPack-iOS.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PowerPack-iOS"
  s.version          = "0.1.0"
  s.summary          = "Miscellaneous utilities for faster iOS development"
  s.description      = <<-DESC
                       This library provides a bunch of miscellaneous utilities
                       that can be used to accelerate the development of iOS apps.
                       Most of these utilities are provided by categories, for easy
                       access all throughout the app and to make it feasible to bring
                       these utilities into legacy apps.
                       DESC
  s.homepage         = "https://github.com/tsilva/PowerPack-iOS"
  s.license          = 'MIT'
  s.author           = { "Tiago Silva" => "eng.tiago.silva@gmail.com" }
  s.source           = { :git => "https://github.com/tsilva/PowerPack-iOS.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/tiagosilva'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Social', 'SystemConfiguration'
  s.dependency 'Reachability'
  s.dependency 'GPUImage'
  s.dependency 'Parse'
  s.dependency 'ParseUI'
  s.dependency 'ParseFacebookUtils'
end
