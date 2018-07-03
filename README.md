# cocoapods-static-swift-framework

A cocoapods plugin that enables static frameworks for all pods.

Cocoapods only supports static framework at pod level, which means an option in podspec and just valid for that pod. By using this plugin, we can make all pod to static framework with only one word!

(There's 'swift' in the plugin name as it's originally built for swift. You can also use it for pure objc project too.)

## Usage
Install via gem:

```
$ gem install cocoapods-static-swift-framework
```

Add the following to your podfile:

```ruby
plugin 'cocoapods-static-swift-framework'

```

NOTE: Static frameworks is still using framework, not static library. So don't forget to add `use_frameworks!`

## About Static framework

### Why

Too many dynamic frameworks will increase app boot time dramatically, also the `Copy framework` build phase will expend unendurable time in the code-build-run loop. (There is also a dyld [crash](https://github.com/Ruenzuo/cocoapods-amimono#why-would-you-want-this-plugin-in-your-podfile)) Static framework have no these problems.

### What is a static framework

First of all, what is a framework? Framework is just a bundle with specifications to organize files, for whom xcode provides convenient methods to link / copy resources. 

I haven't seen any word about static framework in the official documents. There is only (dynamic) framework. So xcode cannot handle it well like dynamic framework. Resources in the framework can't be copied to app's main bundle automatically. If you use cocoapods, it will handle it automatically, but not for the manual integration.

The binary in the framework will be linked statically, as its name, to the main binary. There's no framework file in the `Framework` folder of the app bundle. Resources will copied to app bundle's root path. So there's a potential bug of conflict of resource file names.


## requirement

- Xcode 9
- cocoapods 1.5

## License
MIT

Appreciate a 🌟 if you like it.  Another cocoapods plugin made by me to improve pod compile time: [cocoapods-binary](https://github.com/leavez/cocoapods-binary)
