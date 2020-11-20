# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

use_frameworks!

workspace 'Modularization'

target 'Submission-Capstone' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for Submission-Capstone
  pod 'Texture'
  pod 'Alamofire'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'SDWebImage'
  
end

target 'Common' do
  
  project 'Modules/Common/Common'
end

target 'Core' do 
  project 'Modules/Core/Core'
  
end

target 'Detail' do
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'Alamofire'
  project 'Modules/Detail/Detail'
  
end

target 'Movie' do
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'Alamofire'
  project 'Modules/Movie/Movie'
  
end

target 'Profile' do
  project 'Modules/Profile/Profile'
  
end

target 'Search' do
  project 'Modules/Search/Search'
  
end

target 'Watchlist' do
  project 'Modules/Watchlist/Watchlist'
  
end
