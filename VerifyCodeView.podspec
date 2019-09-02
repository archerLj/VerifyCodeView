Pod::Spec.new do |spec|

  spec.name         = "VerifyCodeView"
  spec.version      = "0.0.1"
  spec.summary      = "简单的验证码输入框控件."

  spec.description  = <<-DESC
               一个简单的验证码输入框控件
                   DESC

  spec.homepage     = "https://github.com/archerLj/VerifyCodeView"
  spec.license      = "MIT"
  spec.author             = { "archerLj" => "lj0011977@163.com" }
  spec.platform     = :ios
  spec.source       = { :git => "https://github.com/archerLj/VerifyCodeView.git", :tag => "#{spec.version}" }

  spec.source_files  = "VerifyCodeView/VerifyCodeView/*.{h,m}"
  spec.requires_arc = true
end
