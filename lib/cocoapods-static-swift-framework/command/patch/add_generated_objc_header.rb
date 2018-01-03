require 'cocoapods/installer'

module Pod
    class Installer
        class Xcode
            class PodsProjectGenerator
                 class PodTargetInstaller
                    # add build phase to copy `PRODUCTNAME-Swift.h` to framwork/Headers
                    # reference to https://github.com/CocoaPods/CocoaPods/blob/3fe4b32a9c3a00635383521affe9484c48cf5add/lib/cocoapods/installer/xcode/pods_project_generator/pod_target_installer.rb line 161
                    def add_build_phase_to_copy_swift_generated_header()

                            # add build phase
                            build_phase = native_target.new_shell_script_build_phase('Copy Swift Generated Header')
                            build_phase.shell_script = <<-eos.strip_heredoc
                            rsync -t "${DERIVED_SOURCES_DIR}/${PRODUCT_NAME}-Swift.h" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.framework/Headers"
                            eos
                    end

                    # add module map content
                    def append_module_map(target)
                        module_map_path = target.module_map_path
                        content = <<-eos.strip_heredoc

                        module #{target.product_module_name}.Swift {
                            header "#{target.product_module_name}-Swift.h"
                            requires objc
                        }
                        eos
                        File.open(module_map_path, 'a') { |f| f.write(content) }
                    end

                    # ---- patch ----
                    old_method = instance_method(:create_build_phase_to_move_static_framework_archive)

                    define_method(:create_build_phase_to_move_static_framework_archive) do
                        old_method.bind(self).()
                        if target.uses_swift? and target.static_framework?
                            add_build_phase_to_copy_swift_generated_header
                            append_module_map target
                        end
                    end




                end
            end
        end
    end
end


