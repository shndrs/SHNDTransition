#
# Be sure to run `pod lib lint SHNDTransition.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SHNDTransition'
  s.version          = '0.1.1'
  s.summary          = 'Custom transition between Storyboards'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC
If you wanna go between Storyboards with custom Segue transition animation you sould try this, super easy super cool...Hope you fellas enjoy it
DESC

  s.homepage         = 'https://github.com/shndrs/SHNDTransition'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sahandraeisi1994@gmail.com' => 'sahandraeisi@yahoo.com' }
  s.source           = { :git => 'https://github.com/shndrs/SHNDTransition.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.0'
  s.source_files = 'SHNDTransition/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SHNDTransition' => ['SHNDTransition/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
