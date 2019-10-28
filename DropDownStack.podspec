
Pod::Spec.new do |spec|
  spec.name         = "DropDownStack"
  spec.version      = "0.0.1"
  spec.summary      = "A short dropdown menu"

  spec.description  = <<-DESC
    This cocoaPods library help you create a UI menu easier
                   DESC

  spec.homepage     = "https://github.com/ngchthanh/DropDownStack"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Nguyen Chi Thanh" => "thanhnguyenchice@gmail.com" }

  spec.ios.deployment_target = "10"
  spec.swift_version = "5"

  spec.source       = { :git => "https://github.com/ngchthanh/DropDownStack.git", :tag => "#{spec.version}" }

  spec.source_files  = "DropDownStack", "DropDownStack/**/*.{h,m}"
  spec.exclude_files = "Classes/Exclude"

end
