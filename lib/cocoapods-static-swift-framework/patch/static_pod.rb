
if Gem::Version.new(Pod::VERSION) < Gem::Version.new('1.7')

    module Pod
        class PodTarget
            def static_framework?
                return true
            end
        end
    end

else

    # cocoapods 1.7 change the implementation of :static_framework?
    # The 'BuildType' contain all related things.
    module Pod
        class Target
            class BuildType
                def linkage
                    :static
                end
            end
        end
    end

end
