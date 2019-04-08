#
# Be sure to run `pod lib lint AlamofireSoap.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |spec|
  spec.name             = 'AlamofireSoap'
  spec.version          = '0.1.1'
  spec.swift_version    = '4.2'
  spec.summary          = 'Alamofire Extension for Soap Webservices'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  spec.description      = <<-DESC
AlamofireSoap is an extension to Alamofire Library to use Soap webservices with Alamofire
                       DESC

  spec.homepage         = 'https://github.com/ShakeebM/AlamofireSoap'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Shakeeb Mancheri' => 'shakeeb818@gmail.com' }
  spec.source           = { :git => 'https://github.com/ShakeebM/AlamofireSoap.git', :tag => spec.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  spec.ios.deployment_target = '8.0'

  spec.source_files = 'AlamofireSoap/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AlamofireSoap' => ['AlamofireSoap/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   spec.dependency 'Alamofire', '~> 4.7.0'
end
