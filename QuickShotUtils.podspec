#
# Be sure to run `pod lib lint QuickShotUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QuickShotUtils'
  s.version          = '0.2.0'
  s.summary          = 'QuickShotUtils are a couple of iOS Swift utility Classes and extensions.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.

QuickShotUtils are a couple of iOS Swift Classes and extensions that add some specific quick custom behaviour to already existing code base.
This project is now migrated to Swift 3.

Features
- [x] it does stuff and has stuf
- [x] decouples some other stuf

                       DESC

  s.homepage         = 'https://github.com/pmlbrito/QuickShotUtils'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Pedro Brito' => 'pedroml.brito@gmail.com' }
  s.source           = { :git => 'https://github.com/pmlbrito/QuickShotUtils.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://medium.com/@pedroml.brito'

  s.ios.deployment_target = '8.0'

  s.source_files = 'QuickShotUtils/Classes/**/*'

  s.requires_arc = true
  
  # s.resource_bundles = {
  #   'QuickShotUtils' => ['QuickShotUtils/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
