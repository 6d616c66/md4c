Pod::Spec.new do |s|
  s.name          = "md4c"
  s.version       = "0.5.3"
  s.summary       = "Markdown for C"
  s.description   = "MD4C is a C Markdown parser with a fast, compact, and flexible implementation."
  s.homepage      = "https://github.com/6d616c66/md4c"
  s.license       = { :type => "MIT", :file => "LICENSE.md" }
  s.author        = { "Martin Mitáš" => "" }
  s.source        = { :git => "https://github.com/6d616c66/md4c.git", :tag => s.version.to_s }

  s.requires_arc  = false
  s.ios.deployment_target = "11.0"
  s.osx.deployment_target = "10.13"
  s.tvos.deployment_target = "11.0"
  s.watchos.deployment_target = "4.0"

  s.default_subspec = "Core"

  s.subspec "Core" do |ss|
    ss.source_files = "src/md4c.c", "src/md4c.h"
    ss.public_header_files = "src/md4c.h"
  end

  s.subspec "HTML" do |ss|
    ss.source_files = "src/md4c-html.c", "src/md4c-html.h", "src/entity.c", "src/entity.h"
    ss.public_header_files = "src/md4c-html.h"
    ss.dependency "md4c/Core"
  end
end