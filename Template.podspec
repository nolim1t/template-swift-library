Pod::Spec.new do |s|
  s.name         = "Template"
  s.version      = "1.0"
  s.summary      = "This is a summary of the library"

  s.description  = <<-DESC
                  This is a long form description for the library.
                  
                  Include stuff on how to install it, and such.
                  
                   DESC

  s.homepage     = "https://github.com/nolim1t/template-swift-library"


  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.authors            = { "Barry Teoh" => "barry@kuggle.rocks" }
  s.social_media_url   = "https://twitter.com/nolim1t"

  # s.platform     = :ios
  s.platform     = :ios, "8.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"

  s.source       = { :git => "https://github.com/nolim1t/template-swift-library.git", :tag => "v0.1" }


  s.source_files  = "Classes", "Classes/**/*.{h,m,swift}"
  s.exclude_files = "Classes/Exclude"
  # s.public_header_files = "Classes/**/*.h"

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  s.requires_arc = true
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"
  s.dependency "Backendless"

end
