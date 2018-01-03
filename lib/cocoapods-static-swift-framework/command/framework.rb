module Pod
    class Podfile
        def static_frameworks
            require 'cocoapods-static-swift-framework/command/patch/static_pod.rb'
            require 'cocoapods-static-swift-framework/command/patch/add_generated_objc_header.rb'
        end
    end
end
