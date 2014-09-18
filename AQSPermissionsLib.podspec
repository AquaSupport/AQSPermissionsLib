Pod::Spec.new do |s|
  s.name         = "AQSPermissionsLib"
  s.version      = "0.1.1"
  s.summary      = "Handle permissions without headache."
  s.homepage     = "https://github.com/AquaSupport/AQSPermissionsLib"
  s.license      = "MIT"
  s.author       = { "kaiinui" => "lied.der.optik@gmail.com" }
  s.source       = { :git => "https://github.com/AquaSupport/AQSPermissionsLib.git", :tag => "v0.1.1" }
  s.source_files  = "PermissionsLib/Classes/**/*.{h,m}"
  s.requires_arc = true
  s.platform = "ios", '7.0'
end
