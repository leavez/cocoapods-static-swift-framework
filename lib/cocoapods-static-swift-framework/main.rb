
Pod::HooksManager.register('cocoapods-static-swift-framework', :pre_install) do |installer_context|

    # check user_framework is on
    podfile = installer_context.podfile
    podfile.target_definition_list.each do |target_definition|
        next if target_definition.name == "Pods"
        if not target_definition.uses_frameworks?
            STDERR.puts "[!] Cocoapods-static-swift-framework requires `use_frameworks!`".red
            exit
        end
    end

    require_relative 'patch/static_pod'
end