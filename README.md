# cocoapods-static-swift-framework

A cocoapods plugin that enables static frameworks for all pods, and sovles the problems in swift integration.

## The problem to solve

When turning on `use_framworks!` in podfile, libraries will be used in form of (dynamic) framework. App boot time will be affected dramatically when there're too many frameworks ( like 100 ), also a dyld [crash](https://github.com/Ruenzuo/cocoapods-amimono#why-would-you-want-this-plugin-in-your-podfile) and an obvious time in copy framework script.

There's no benefit from using dynamic framework on a private lib. So when static library for swift introduced in Xcode 9,  we desperately want to adopt it for swift integration. Along with this plugin, cocoapods and xcode would statically link the libs and the problem is solved.

## So, what does the plugin patch exactly?

Cocoapods supports static framework in v1.4, but doesn't handle 2 things well:
- It only supports static framework at pod level, means an option in podspec and just valid for that pod.
- Static swift framework target doesn't copy the generated header file of swift to the framework. So objc code can't import and use swift code.

This plugin makes all pods to static frameworks and copies the missing header. To be precise, the aggregate target is still a dynamic framework. The main target of your app links one dynamic framework, who contains all the pods' code statically. This plugin doesn't modify cocoapods too much and the cost is acceptable. (100 pods project increase 120ms for dynamic linking in boot time)

## Usage
Install via gem:

```
$ gem install cocoapods-static-swift-framework
```

Add the following to your podfile:

```ruby
plugin 'cocoapods-static-swift-framework'
static_frameworks

```

NOTE: Static frameworks is still using framework, not static library. So don't forget to add `use_frameworks!`

#### requirement
- Xcode 9
- cocoapods 1.4 ( tested on 1.4.0rc1 )



## License
MIT

Appreciate a 🌟 if you like it.  Another cocoapods plugin made by me [cocoapod-developing-folder](https://github.com/leavez/cocoapods-developing-folder)