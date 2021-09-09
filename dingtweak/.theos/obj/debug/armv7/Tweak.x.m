#line 1 "Tweak.x"
#import <UIKit/UIKit.h>


@interface WWKAttendanceBinaryCheckViewController : UIViewController

@end


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class WWKAttendanceBinaryCheckViewController; 
static void (*_logos_orig$_ungrouped$WWKAttendanceBinaryCheckViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL WWKAttendanceBinaryCheckViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WWKAttendanceBinaryCheckViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL WWKAttendanceBinaryCheckViewController* _LOGOS_SELF_CONST, SEL); 

#line 8 "Tweak.x"


static void _logos_method$_ungrouped$WWKAttendanceBinaryCheckViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL WWKAttendanceBinaryCheckViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$WWKAttendanceBinaryCheckViewController$viewDidLoad(self, _cmd);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"我是林磊-iOS开发工程师" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alert addAction:alertAction];
        [self presentViewController:alert animated:YES completion:nil];
    });
    NSLog(@"-----------------viewDidLoad--------------------------");
}



static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$WWKAttendanceBinaryCheckViewController = objc_getClass("WWKAttendanceBinaryCheckViewController"); { MSHookMessageEx(_logos_class$_ungrouped$WWKAttendanceBinaryCheckViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$WWKAttendanceBinaryCheckViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$WWKAttendanceBinaryCheckViewController$viewDidLoad);}} }
#line 24 "Tweak.x"
