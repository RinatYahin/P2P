Pod::Spec.new do |s|

  s.name         = "P2PCore"
  s.version      = "0.0.1"
  s.summary      = "P2PCore - Framework for network requests Wallet One P2P"

  s.homepage     = "https://github.com/WalletOne/P2P.git"

  s.license = 'MIT'

  s.author             = { "Vitaliy" => "vitaly.kuzmenko@walletone.com" }

  s.ios.deployment_target = '8.0'

  s.source       = { :git => s.homepage, :tag => s.version.to_s }

  s.source_files  = "P2PCore/**/*.swift"
  
  s.requires_arc = 'true'
  
  s.pod_target_xcconfig = {
    'SWIFT_VERSION' => '3.0',
  }
  
  s.xcconfig = { 
      'SWIFT_INCLUDE_PATHS' => '$(PODS_ROOT)/P2PCore/Library/CommonCrypto' 
  }
  
  s.preserve_paths = 'P2PCore/Library/CommonCrypto/module.map'
   
end