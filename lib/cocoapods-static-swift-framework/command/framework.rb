module Pod
    class Podfile
        def all_static!
            require 'cocoapods-static-swift-framework/command/patch/static_pod.rb'
        end
    end
end
