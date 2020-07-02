# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def networkPod
  pod 'Alamofire', '4.7.3'
end

def dataProcessingPod
  pod 'Bond', '7.5.0'
end

def testingPod
  pod 'OHHTTPStubs/Swift', '~> 8.0.0'
end

target 'ECommerce' do
  use_frameworks!

  networkPod
  dataProcessingPod
end

target 'ECommerceTests' do
  inherit! :search_paths
  use_frameworks!
  
  testingPod
  dataProcessingPod
end
