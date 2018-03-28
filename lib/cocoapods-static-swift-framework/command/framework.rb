module Pod
    class Podfile
        def static_frameworks
            require 'cocoapods-static-swift-framework/command/patch/static_pod.rb'
        end
    end
end
