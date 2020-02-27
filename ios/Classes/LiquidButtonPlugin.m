#import "LiquidButtonPlugin.h"
#if __has_include(<liquid_button/liquid_button-Swift.h>)
#import <liquid_button/liquid_button-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "liquid_button-Swift.h"
#endif

@implementation LiquidButtonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLiquidButtonPlugin registerWithRegistrar:registrar];
}
@end
