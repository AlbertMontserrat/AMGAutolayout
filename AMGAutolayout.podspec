#
# Be sure to run `pod lib lint AMGAutolayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AMGAutolayout'
  s.version          = '1.0.1'
  s.summary          = 'Lightwheight DSL for iOS Autolayout.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/AlbertMontserrat/AMGAutolayout'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'AlbertMontserrat' => 'albert.montserrat.gambus@gmail.com' }
  s.source           = { :git => 'https://github.com/AlbertMontserrat/AMGAutolayout.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.swift_versions = '4.0'

  s.source_files = 'AMGAutolayout/Classes/**/*'
  
end
