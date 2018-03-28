# cocoapods-static-swift-framework

A cocoapods plugin that enables static frameworks for all pods.

Cocoapods only supports static framework at pod level, which means an option in podspec and just valid for that pod. By using this plugin, we can make all pod to static framework with only one word!


NOTE:

Please use cocoapods 1.5. Static framework support on cocoapods 1.4 is totally a disaster.


## Usage
Install via gem:

```
$ gem install cocoapods-static-swift-framework
```

Add the following to your podfile:

```ruby
plugin 'cocoapods-static-swift-framework'
all_static!

```

NOTE: Static frameworks is still using framework, not static library. So don't forget to add `use_frameworks!`

## Why use static framework

When turning on `use_framworks!` in podfile, libraries will be used in form of (dynamic) framework. App boot time will be affected dramatically when there're too many frameworks ( like 100 ), also a dyld [crash](https://github.com/Ruenzuo/cocoapods-amimono#why-would-you-want-this-plugin-in-your-podfile) and an obvious time in copy framework script.

There's no benefit from using dynamic framework on a private lib. So when static library for swift introduced in Xcode 9,  we desperately want to adopt it for swift integration. Along with this plugin, cocoapods and xcode would statically link the libs and the problem is solved.


#### requirement
- Xcode 9
- cocoapods 1.5 ( tested on 1.5.0.beta.1 )



## License
MIT

Appreciate a 🌟 if you like it.  Another cocoapods plugin made by me [cocoapod-developing-folder](https://github.com/leavez/cocoapods-developing-folder)