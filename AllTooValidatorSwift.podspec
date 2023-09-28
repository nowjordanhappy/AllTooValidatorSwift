#
# Be sure to run `pod lib lint AllTooValidatorSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AllTooValidatorSwift'
  s.version          = '0.1.1'
  s.summary          = 'This is a Swift validator that uses the Chain of Responsibility pattern to add validations for inputs or other values.'
  s.module_name      = "AllTooValidator"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    Validator using the Chain of Responsibility pattern. This is a Swift validator that uses the Chain of Responsibility pattern to add validations for inputs or other values.
                      DESC

  s.homepage         = 'https://github.com/nowjordanhappy/AllTooValidatorSwift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jordan R. A.' => 'nowjordanhappy@gmail.com' }
  s.source           = { :git => 'https://github.com/nowjordanhappy/AllTooValidatorSwift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'AllTooValidatorSwift/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AllTooValidatorSwift' => ['AllTooValidatorSwift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
