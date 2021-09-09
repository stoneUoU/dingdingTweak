#line 1 "Tweak.xm"
#import <UIKit/UIKit.h>
#import "src/YLZLocationManager.h"




#define YLZDefaults [NSUserDefaults standardUserDefaults]
#define YLZKey @"switch_isOpen"
#define YLZSiteKey0 @"switch_isOpen0"
#define YLZSiteKey1 @"switch_isOpen1"
#define YLZSiteKey2 @"switch_isOpen2"



















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

@class LAPluginInstanceCollector; @class DTInfoPlist; @class DTTableViewHandler; @class DTSettingViewController; 
static void (*_logos_orig$_ungrouped$LAPluginInstanceCollector$handleJavaScriptRequest$callback$)(_LOGOS_SELF_TYPE_NORMAL LAPluginInstanceCollector* _LOGOS_SELF_CONST, SEL, NSDictionary *, void(^)(id)); static void _logos_method$_ungrouped$LAPluginInstanceCollector$handleJavaScriptRequest$callback$(_LOGOS_SELF_TYPE_NORMAL LAPluginInstanceCollector* _LOGOS_SELF_CONST, SEL, NSDictionary *, void(^)(id)); static void (*_logos_orig$_ungrouped$DTSettingViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL DTSettingViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$DTSettingViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL DTSettingViewController* _LOGOS_SELF_CONST, SEL); static long long (*_logos_orig$_ungrouped$DTTableViewHandler$numberOfSectionsInTableView$)(_LOGOS_SELF_TYPE_NORMAL DTTableViewHandler* _LOGOS_SELF_CONST, SEL, id); static long long _logos_method$_ungrouped$DTTableViewHandler$numberOfSectionsInTableView$(_LOGOS_SELF_TYPE_NORMAL DTTableViewHandler* _LOGOS_SELF_CONST, SEL, id); static long long (*_logos_orig$_ungrouped$DTTableViewHandler$tableView$numberOfRowsInSection$)(_LOGOS_SELF_TYPE_NORMAL DTTableViewHandler* _LOGOS_SELF_CONST, SEL, id, long long); static long long _logos_method$_ungrouped$DTTableViewHandler$tableView$numberOfRowsInSection$(_LOGOS_SELF_TYPE_NORMAL DTTableViewHandler* _LOGOS_SELF_CONST, SEL, id, long long); static void _logos_method$_ungrouped$DTTableViewHandler$onSwitch$(_LOGOS_SELF_TYPE_NORMAL DTTableViewHandler* _LOGOS_SELF_CONST, SEL, UISwitch *); static UITableViewCell * _logos_method$_ungrouped$DTTableViewHandler$fireTableViewCellWith$withSwitchOn$withTitleString$withTag$withTableView$(_LOGOS_SELF_TYPE_NORMAL DTTableViewHandler* _LOGOS_SELF_CONST, SEL, NSString *, BOOL, NSString *, NSInteger, UITableView *); static id (*_logos_orig$_ungrouped$DTTableViewHandler$tableView$cellForRowAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL DTTableViewHandler* _LOGOS_SELF_CONST, SEL, id, id); static id _logos_method$_ungrouped$DTTableViewHandler$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL DTTableViewHandler* _LOGOS_SELF_CONST, SEL, id, id); static double (*_logos_orig$_ungrouped$DTTableViewHandler$tableView$heightForRowAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL DTTableViewHandler* _LOGOS_SELF_CONST, SEL, id, id); static double _logos_method$_ungrouped$DTTableViewHandler$tableView$heightForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL DTTableViewHandler* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$DTTableViewHandler$tableView$didSelectRowAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL DTTableViewHandler* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$DTTableViewHandler$tableView$didSelectRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL DTTableViewHandler* _LOGOS_SELF_CONST, SEL, id, id); static NSString * (*_logos_meta_orig$_ungrouped$DTInfoPlist$getAppBundleId)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static NSString * _logos_meta_method$_ungrouped$DTInfoPlist$getAppBundleId(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); 

#line 30 "Tweak.xm"

static void _logos_method$_ungrouped$LAPluginInstanceCollector$handleJavaScriptRequest$callback$(_LOGOS_SELF_TYPE_NORMAL LAPluginInstanceCollector* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSDictionary * arg1, void(^arg2)(id)){
    
    if ([YLZLocationManager shareInstance].isOpen) {
        NSLog(@"Open-Open-Open");
        if([arg1[@"action"] isEqualToString:@"start"]){
            
            id myCallBack = ^(NSDictionary * block_arg){
                if([block_arg[@"keep"] isEqualToString:@"1"]){
                    NSMutableDictionary * tempDic = [NSMutableDictionary dictionaryWithDictionary:block_arg];
                    
                    tempDic[@"result"][@"latitude"] = [NSString stringWithFormat:@"%f",[YLZLocationManager shareInstance].coordinate.latitude];
                    tempDic[@"result"][@"longitude"] = [NSString stringWithFormat:@"%f",[YLZLocationManager shareInstance].coordinate.longitude];
                    
                    arg2(tempDic);
                    
                }else{
                    
                    arg2(block_arg);
                }
            };
            _logos_orig$_ungrouped$LAPluginInstanceCollector$handleJavaScriptRequest$callback$(self, _cmd, arg1,myCallBack);
        } else if([arg1[@"action"] isEqualToString:@"getInterface"]) {
            
            id myCallBack = ^(NSDictionary * block_arg){
                NSMutableDictionary * tempDic = [NSMutableDictionary dictionaryWithDictionary:block_arg];
                
                tempDic[@"result"][@"macIp"] = @"f0:b4:29:6b:fe:51";
                
                arg2(tempDic);
            };
            
            _logos_orig$_ungrouped$LAPluginInstanceCollector$handleJavaScriptRequest$callback$(self, _cmd, arg1,myCallBack);
        } else {
            _logos_orig$_ungrouped$LAPluginInstanceCollector$handleJavaScriptRequest$callback$(self, _cmd, arg1, arg2);
        }
    } else {
        _logos_orig$_ungrouped$LAPluginInstanceCollector$handleJavaScriptRequest$callback$(self, _cmd, arg1, arg2);
        NSLog(@"Close-Close-Close");
    }
}



@interface DTViewController : UIViewController

@end

@interface DTTableViewController : DTViewController 

@end

@interface DTSettingViewController : UIViewController

- (void)reloadDataSoureAndTable;

@end



static void _logos_method$_ungrouped$DTSettingViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL DTSettingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$DTSettingViewController$viewDidLoad(self, _cmd);
    [YLZLocationManager shareInstance].isOpen = [YLZDefaults boolForKey:YLZKey];
}



@interface DTTableViewHandler:NSObject

- (UITableViewCell *)fireTableViewCellWith:(NSString *)cellId withSwitchOn:(BOOL)switchOn withTitleString:(NSString *)titleString withTag:(NSInteger)tag withTableView:(UITableView *)tableView;

@end




static long long _logos_method$_ungrouped$DTTableViewHandler$numberOfSectionsInTableView$(_LOGOS_SELF_TYPE_NORMAL DTTableViewHandler* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id tableView) {

    id view = [(id)self valueForKey:@"delegate"];
    BOOL isDTSettingViewController = [@"DTSettingViewController" isEqualToString:NSStringFromClass([view class])];
    if (isDTSettingViewController) {
        return _logos_orig$_ungrouped$DTTableViewHandler$numberOfSectionsInTableView$(self, _cmd, tableView)+2;
    } else {
        return _logos_orig$_ungrouped$DTTableViewHandler$numberOfSectionsInTableView$(self, _cmd, tableView);
    }
}



static long long _logos_method$_ungrouped$DTTableViewHandler$tableView$numberOfRowsInSection$(_LOGOS_SELF_TYPE_NORMAL DTTableViewHandler* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id tableView, long long section) {
    id view = [(id)self valueForKey:@"delegate"];
    BOOL isDTSettingViewController = [@"DTSettingViewController" isEqualToString:NSStringFromClass([view class])];
    if (isDTSettingViewController) {
        if (section == 0 || section == 1) {
            return 0;
        } else if (section == 2) {
            return _logos_orig$_ungrouped$DTTableViewHandler$tableView$numberOfRowsInSection$(self, _cmd, tableView, section);
        } else if (section == 3)  {
            return 1;
        } else {
            return 3;
        }
    } else {
        return _logos_orig$_ungrouped$DTTableViewHandler$tableView$numberOfRowsInSection$(self, _cmd, tableView, section);
    }
}



static void _logos_method$_ungrouped$DTTableViewHandler$onSwitch$(_LOGOS_SELF_TYPE_NORMAL DTTableViewHandler* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UISwitch * switchView) {

    if (switchView.tag == 0) {
        [YLZLocationManager shareInstance].isOpen = switchView.isOn;
        [YLZDefaults setBool:switchView.isOn forKey:YLZKey];
        if (!switchView.isOn) {
            [YLZDefaults setBool:NO forKey:YLZSiteKey0];
            [YLZDefaults setBool:NO forKey:YLZSiteKey1];
            [YLZDefaults setBool:NO forKey:YLZSiteKey2];
        }
    } else {
        if (switchView.tag == 1) {
            
            NSString *latitudeString = @"24.48591012";
            NSString *longitudeString = @"118.17774973";
            if (switchView.isOn) {
               [YLZLocationManager shareInstance].coordinate = CLLocationCoordinate2DMake([latitudeString doubleValue], [longitudeString doubleValue]); 
            }
            [YLZDefaults setBool:switchView.isOn forKey:YLZSiteKey0];
            [YLZDefaults setBool:NO forKey:YLZSiteKey1];
            [YLZDefaults setBool:NO forKey:YLZSiteKey2];
        } else if (switchView.tag == 2) {
            
            NSString *latitudeString = @"39.92178600";
            NSString *longitudeString = @"116.3473400";
            if (switchView.isOn) {
               [YLZLocationManager shareInstance].coordinate = CLLocationCoordinate2DMake([latitudeString doubleValue], [longitudeString doubleValue]); 
            }
            [YLZDefaults setBool:NO forKey:YLZSiteKey0];
            [YLZDefaults setBool:switchView.isOn forKey:YLZSiteKey1];
            [YLZDefaults setBool:NO forKey:YLZSiteKey2];
        } else {
            
            NSString *latitudeString = @"24.50076200";
            NSString *longitudeString = @"118.12739500";
            if (switchView.isOn) {
               [YLZLocationManager shareInstance].coordinate = CLLocationCoordinate2DMake([latitudeString doubleValue], [longitudeString doubleValue]); 
            }
            [YLZDefaults setBool:NO forKey:YLZSiteKey0];
            [YLZDefaults setBool:NO forKey:YLZSiteKey1];
            [YLZDefaults setBool:switchView.isOn forKey:YLZSiteKey2];
        }
    }
    [YLZDefaults synchronize];

    DTSettingViewController *view = [(DTSettingViewController *)self valueForKey:@"delegate"];
    [view reloadDataSoureAndTable];
}


static UITableViewCell * _logos_method$_ungrouped$DTTableViewHandler$fireTableViewCellWith$withSwitchOn$withTitleString$withTag$withTableView$(_LOGOS_SELF_TYPE_NORMAL DTTableViewHandler* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * cellId, BOOL switchOn, NSString * titleString, NSInteger tag, UITableView * tableView) {
    UITableViewCell *cell = [tableView 
       dequeueReusableCellWithIdentifier:cellId];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] 
        initWithStyle:UITableViewCellStyleDefault 
        reuseIdentifier:cellId];
        cell.backgroundColor = [UIColor whiteColor];
    }
    cell.textLabel.text = titleString;
    
    UISwitch *switchView = [[UISwitch alloc] init];
    switchView.on = switchOn;
    switchView.tag = tag;
    BOOL isOpen = [YLZDefaults boolForKey:YLZKey];
    if (tag != 0) {
        switchView.hidden = !isOpen;
    }
    [switchView addTarget:self 
      action:@selector(onSwitch:) 
      forControlEvents:UIControlEventValueChanged];
    cell.accessoryView = switchView;
    return cell;
}



static id _logos_method$_ungrouped$DTTableViewHandler$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL DTTableViewHandler* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id tableView, id indexPath) {

    id view = [(id)self valueForKey:@"delegate"];
    BOOL isDTSettingViewController = [@"DTSettingViewController" isEqualToString:NSStringFromClass([view class])];
    BOOL isOpen = [YLZDefaults boolForKey:YLZKey];
    if (isDTSettingViewController) {
        if ([indexPath section] == 0 || [indexPath section] == 1 || [indexPath section] == 2) {
            return _logos_orig$_ungrouped$DTTableViewHandler$tableView$cellForRowAtIndexPath$(self, _cmd, tableView, indexPath);
        } else if ([indexPath section] == 3) {
            return [self fireTableViewCellWith:@"switchCellId" withSwitchOn:[YLZDefaults boolForKey:YLZKey] withTitleString:@"打卡插件开关" withTag:0 withTableView:tableView];
        } else {
           if ([indexPath row] == 0) {
            return [self fireTableViewCellWith:@"CellId0" withSwitchOn:isOpen ? [YLZDefaults boolForKey:YLZSiteKey0] : NO withTitleString:@"易联众技术股份有限公司" withTag:1 withTableView:tableView];
           } else if ([indexPath row] == 1) {
            return [self fireTableViewCellWith:@"CellId1" withSwitchOn:isOpen ? [YLZDefaults boolForKey:YLZSiteKey1] : NO withTitleString:@"国家医疗保障局" withTag:2 withTableView:tableView];
           } else {
            return [self fireTableViewCellWith:@"CellId2" withSwitchOn:isOpen ? [YLZDefaults boolForKey:YLZSiteKey2] : NO withTitleString:@"SM城市广场(宝岛眼镜)" withTag:3 withTableView:tableView];
           }
        }
    } else {
        return _logos_orig$_ungrouped$DTTableViewHandler$tableView$cellForRowAtIndexPath$(self, _cmd, tableView, indexPath);
    }
}



static double _logos_method$_ungrouped$DTTableViewHandler$tableView$heightForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL DTTableViewHandler* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id tableView, id indexPath) { 

    id view = [(id)self valueForKey:@"delegate"];
    BOOL isDTSettingViewController = [@"DTSettingViewController" isEqualToString:NSStringFromClass([view class])];
    
    if (isDTSettingViewController) {
        if ([indexPath section] == 0 || [indexPath section] == 1 || [indexPath section] == 2) {
            return _logos_orig$_ungrouped$DTTableViewHandler$tableView$heightForRowAtIndexPath$(self, _cmd, tableView, indexPath);
        } else {
            return 44;
        }
    } else {
        return _logos_orig$_ungrouped$DTTableViewHandler$tableView$heightForRowAtIndexPath$(self, _cmd, tableView, indexPath);
    }
}



static void _logos_method$_ungrouped$DTTableViewHandler$tableView$didSelectRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL DTTableViewHandler* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id tableView, id indexPath) {
    
    id view = [(id)self valueForKey:@"delegate"];
    BOOL isDTSettingViewController = [@"DTSettingViewController" isEqualToString:NSStringFromClass([view class])];
    if (isDTSettingViewController) {
        if ([indexPath section] == 0 || [indexPath section] == 1 || [indexPath section] == 2) {
            return _logos_orig$_ungrouped$DTTableViewHandler$tableView$didSelectRowAtIndexPath$(self, _cmd, tableView, indexPath);
        } else {
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            return; 
        }
    } else {
        return _logos_orig$_ungrouped$DTTableViewHandler$tableView$didSelectRowAtIndexPath$(self, _cmd, tableView, indexPath);
    }

}






static NSString * _logos_meta_method$_ungrouped$DTInfoPlist$getAppBundleId(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return @"com.laiwang.DingTalk";
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$LAPluginInstanceCollector = objc_getClass("LAPluginInstanceCollector"); { MSHookMessageEx(_logos_class$_ungrouped$LAPluginInstanceCollector, @selector(handleJavaScriptRequest:callback:), (IMP)&_logos_method$_ungrouped$LAPluginInstanceCollector$handleJavaScriptRequest$callback$, (IMP*)&_logos_orig$_ungrouped$LAPluginInstanceCollector$handleJavaScriptRequest$callback$);}Class _logos_class$_ungrouped$DTSettingViewController = objc_getClass("DTSettingViewController"); { MSHookMessageEx(_logos_class$_ungrouped$DTSettingViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$DTSettingViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$DTSettingViewController$viewDidLoad);}Class _logos_class$_ungrouped$DTTableViewHandler = objc_getClass("DTTableViewHandler"); { MSHookMessageEx(_logos_class$_ungrouped$DTTableViewHandler, @selector(numberOfSectionsInTableView:), (IMP)&_logos_method$_ungrouped$DTTableViewHandler$numberOfSectionsInTableView$, (IMP*)&_logos_orig$_ungrouped$DTTableViewHandler$numberOfSectionsInTableView$);}{ MSHookMessageEx(_logos_class$_ungrouped$DTTableViewHandler, @selector(tableView:numberOfRowsInSection:), (IMP)&_logos_method$_ungrouped$DTTableViewHandler$tableView$numberOfRowsInSection$, (IMP*)&_logos_orig$_ungrouped$DTTableViewHandler$tableView$numberOfRowsInSection$);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UISwitch *), strlen(@encode(UISwitch *))); i += strlen(@encode(UISwitch *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$DTTableViewHandler, @selector(onSwitch:), (IMP)&_logos_method$_ungrouped$DTTableViewHandler$onSwitch$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(UITableViewCell *), strlen(@encode(UITableViewCell *))); i += strlen(@encode(UITableViewCell *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSString *), strlen(@encode(NSString *))); i += strlen(@encode(NSString *)); memcpy(_typeEncoding + i, @encode(BOOL), strlen(@encode(BOOL))); i += strlen(@encode(BOOL)); memcpy(_typeEncoding + i, @encode(NSString *), strlen(@encode(NSString *))); i += strlen(@encode(NSString *)); memcpy(_typeEncoding + i, @encode(NSInteger), strlen(@encode(NSInteger))); i += strlen(@encode(NSInteger)); memcpy(_typeEncoding + i, @encode(UITableView *), strlen(@encode(UITableView *))); i += strlen(@encode(UITableView *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$DTTableViewHandler, @selector(fireTableViewCellWith:withSwitchOn:withTitleString:withTag:withTableView:), (IMP)&_logos_method$_ungrouped$DTTableViewHandler$fireTableViewCellWith$withSwitchOn$withTitleString$withTag$withTableView$, _typeEncoding); }{ MSHookMessageEx(_logos_class$_ungrouped$DTTableViewHandler, @selector(tableView:cellForRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$DTTableViewHandler$tableView$cellForRowAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$DTTableViewHandler$tableView$cellForRowAtIndexPath$);}{ MSHookMessageEx(_logos_class$_ungrouped$DTTableViewHandler, @selector(tableView:heightForRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$DTTableViewHandler$tableView$heightForRowAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$DTTableViewHandler$tableView$heightForRowAtIndexPath$);}{ MSHookMessageEx(_logos_class$_ungrouped$DTTableViewHandler, @selector(tableView:didSelectRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$DTTableViewHandler$tableView$didSelectRowAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$DTTableViewHandler$tableView$didSelectRowAtIndexPath$);}Class _logos_class$_ungrouped$DTInfoPlist = objc_getClass("DTInfoPlist"); Class _logos_metaclass$_ungrouped$DTInfoPlist = object_getClass(_logos_class$_ungrouped$DTInfoPlist); { MSHookMessageEx(_logos_metaclass$_ungrouped$DTInfoPlist, @selector(getAppBundleId), (IMP)&_logos_meta_method$_ungrouped$DTInfoPlist$getAppBundleId, (IMP*)&_logos_meta_orig$_ungrouped$DTInfoPlist$getAppBundleId);}} }
#line 288 "Tweak.xm"
