Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.name                    = "SwiftlyRater"
  s.version                 = "1.0.0"
  s.summary                 = "A simple and lightweight Review Manager for iOS, written in Swift 3"
  s.description             = <<-DESC
                              SwiftlyRater is an Alert that asks users to leave a review on the AppStore, whenever some specific conditions are met"
                              DESC

  s.homepage                = "https://github.com/gdimaggio/SwiftlyRater"
  # s.screenshots           = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license                 = { :type => "MIT", :file => "LICENSE" }
  s.author                  = { "Gianluca Di maggio" => "gdimaggio91@gmail.com" }
  s.ios.deployment_target   = "10.0"
  
  s.source                  = { :git => "https://github.com/gdimaggio/SwiftlyRater.git", :tag => s.version }
  s.source_files            = "SwiftlyRater/*.{h,swift}", "SwiftlyRater/Reachability/*"
  s.resources               = "Localization/*.lproj"
  # s.pod_target_xcconfig     = { 'SWIFT_VERSION' => '3' }
  s.requires_arc            = true

end
