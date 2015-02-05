Pod::Spec.new do |s|
  s.name             = "IGTableViewEstimatedHeightCache"
  s.version          = "0.2.0"
  s.summary          = "Simple solution for adding estimated height cache to table view controller"
  s.description      = <<-DESC
                       Simple solution for adding estimated height cache to table view controller
					   
					   Based on StackOverflow.com answer (http://stackoverflow.com/a/26371697/40444) by Kai Burghardt (http://stackoverflow.com/users/1978096/kai-burghardt)
                       DESC
  s.homepage         = "https://github.com/IndieGoGo/IGTableViewEstimatedHeightCache"
  s.license          = 'MIT'
  s.author           = { 
  			'Indiegogo' => 'tech+gogopair@indiegogo.com',
			"janj" => "jan.jirout@indiegogo.com",
			"glentregoning" => "glen.tregoning@indiegogo.com"
  }
  s.source           = { :git => "https://github.com/IndieGoGo/IGTableViewEstimatedHeightCache.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Indiegogo'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*'
end
