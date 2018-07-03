
Pod::HooksManager.register('cocoapods-static-swift-framework', :pre_install) do |installer_context|
    require_relative 'patch/static_pod'
end