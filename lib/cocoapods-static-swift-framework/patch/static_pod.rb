module Pod
    class PodTarget

        if Pod::VERSION.start_with? "1.7"

            # static_swift_framework_old_new = instance_method :initialize
            # define_method :initialize do |*args|
            #     result = static_swift_framework_old_new.bind(self).(*args)
            #     build_type.instance_variable_set(:@linkage, :static)
            #     next result
            # end

        elsif (Pod::VERSION.start_with? "1.5") || (Pod::VERSION.start_with? "1.6")

            def static_framework?
                return true
            end
        end
    end
end

            module Pod
                class Specification
                    module DSL
                        
                        module RootAttributesAccessors

                            def static_framework
                                true
                            end
                        end
                    end
                end
            end

