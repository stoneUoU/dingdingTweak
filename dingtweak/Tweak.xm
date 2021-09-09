#import <UIKit/UIKit.h>
#import "src/YLZLocationManager.h"

//本文演示插件无任何商业目的，也不从事任何商业性质活动。


#define YLZDefaults [NSUserDefaults standardUserDefaults]
#define YLZKey @"switch_isOpen"
#define YLZSiteKey0 @"switch_isOpen0"
#define YLZSiteKey1 @"switch_isOpen1"
#define YLZSiteKey2 @"switch_isOpen2"

//殿前:
static NSString *sitelatitudeString = @"24.52680600";
static NSString *sitelongitudeString = @"118.10937700";

//易联众信息技术股份有限公司位置:
// static NSString *latitudeString = @"24.48591012";
// static NSString *longitudeString = @"118.17774973";


//SM城市广场(宝岛眼镜):
// static NSString *latitudeString = @"24.50076200";
// static NSString *longitudeString = @"118.12739500";

//国家医疗保障局:
// static NSString *latitudeString = @"39.92178600";
// static NSString *longitudeString = @"116.3473400";

%hook LAPluginInstanceCollector
- (void)handleJavaScriptRequest:(NSDictionary *)arg1 callback:(void(^)(id))arg2{
    //判断下开关是否打开：
    if ([YLZLocationManager shareInstance].isOpen) {
        NSLog(@"Open-Open-Open");
        if([arg1[@"action"] isEqualToString:@"start"]){//有可能需要修改定位信息!
            //定义一个myBlock
            id myCallBack = ^(NSDictionary * block_arg){
                if([block_arg[@"keep"] isEqualToString:@"1"]){//需要修改GPS
                    NSMutableDictionary * tempDic = [NSMutableDictionary dictionaryWithDictionary:block_arg];
                    //修改block中的字典的值!
                    tempDic[@"result"][@"latitude"] = [NSString stringWithFormat:@"%f",[YLZLocationManager shareInstance].coordinate.latitude];
                    tempDic[@"result"][@"longitude"] = [NSString stringWithFormat:@"%f",[YLZLocationManager shareInstance].coordinate.longitude];
                    //使用修改后的!
                    arg2(tempDic);
                    
                }else{
                    //保持原有掉用!!
                    arg2(block_arg);
                }
            };
            %orig(arg1,myCallBack);
        } else if([arg1[@"action"] isEqualToString:@"getInterface"]) {//修改WIFI!!
            //定义一个myBlock
            id myCallBack = ^(NSDictionary * block_arg){
                NSMutableDictionary * tempDic = [NSMutableDictionary dictionaryWithDictionary:block_arg];
                //修改block中的字典的值!, 这里修改为你公司设置的 WiFi macIP
                tempDic[@"result"][@"macIp"] = @"f0:b4:29:6b:fe:51";
                //使用修改后的!
                arg2(tempDic);
            };
            
            %orig(arg1,myCallBack);
        } else {
            %orig;
        }
    } else {
        if([arg1[@"action"] isEqualToString:@"start"]){//有可能需要修改定位信息!
            //定义一个myBlock
            id myCallBack = ^(NSDictionary * block_arg){
                if([block_arg[@"keep"] isEqualToString:@"1"]){//需要修改GPS
                    NSMutableDictionary * tempDic = [NSMutableDictionary dictionaryWithDictionary:block_arg];
                    //修改block中的字典的值!
                    tempDic[@"result"][@"latitude"] = sitelatitudeString;
                    tempDic[@"result"][@"longitude"] = sitelongitudeString;
                    //使用修改后的!
                    arg2(tempDic);
                    
                }else{
                    //保持原有掉用!!
                    arg2(block_arg);
                }
            };
            %orig(arg1,myCallBack);
        } else {
            %orig;
        }
    }
}
%end


@interface DTViewController : UIViewController

@end

@interface DTTableViewController : DTViewController 

@end

@interface DTSettingViewController : UIViewController

- (void)reloadDataSoureAndTable;

@end

%hook DTSettingViewController

- (void)viewDidLoad {
    %orig;
    [YLZLocationManager shareInstance].isOpen = [YLZDefaults boolForKey:YLZKey];

    NSString *latitudeString = @"";
    NSString *longitudeString = = @"";
    //设置打卡位置
    if ([YLZDefaults boolForKey:YLZSiteKey0]) {
        latitudeString = @"24.48591012";
        longitudeString = @"118.17774973";
    } else if ([YLZDefaults boolForKey:YLZSiteKey1]) {
        latitudeString = @"24.63589400";
        longitudeString = @"118.07418400";
    } else if ([YLZDefaults boolForKey:YLZSiteKey2]) {
        latitudeString = @"24.50076200";
        longitudeString = @"118.12739500";
    }
    [YLZLocationManager shareInstance].coordinate = CLLocationCoordinate2DMake([latitudeString doubleValue], [longitudeString doubleValue]); 
            
}

%end

@interface DTTableViewHandler:NSObject

- (UITableViewCell *)fireTableViewCellWith:(NSString *)cellId withSwitchOn:(BOOL)switchOn withTitleString:(NSString *)titleString withTag:(NSInteger)tag withTableView:(UITableView *)tableView;

@end

%hook DTTableViewHandler

- (long long)numberOfSectionsInTableView:(id)tableView
{

    id view = [(id)self valueForKey:@"delegate"];
    BOOL isDTSettingViewController = [@"DTSettingViewController" isEqualToString:NSStringFromClass([view class])];
    if (isDTSettingViewController) {
        return %orig+2;
    } else {
        return %orig;
    }
}

// 每一组有多少行
- (long long)tableView:(id)tableView numberOfRowsInSection:(long long)section
{
    id view = [(id)self valueForKey:@"delegate"];
    BOOL isDTSettingViewController = [@"DTSettingViewController" isEqualToString:NSStringFromClass([view class])];
    if (isDTSettingViewController) {
        if (section == 0 || section == 1) {
            return 0;
        } else if (section == 2) {
            return %orig;
        } else if (section == 3)  {
            return 1;
        } else {
            return 3;
        }
    } else {
        return %orig;
    }
}

// 监听插件开关(新方法需要添加%new)
%new
- (void)onSwitch:(UISwitch *)switchView {

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
            //易联众信息技术股份有限公司位置:
            NSString *latitudeString = @"24.48591012";
            NSString *longitudeString = @"118.17774973";
            if (switchView.isOn) {
               [YLZLocationManager shareInstance].coordinate = CLLocationCoordinate2DMake([latitudeString doubleValue], [longitudeString doubleValue]); 
            }
            [YLZDefaults setBool:switchView.isOn forKey:YLZSiteKey0];
            [YLZDefaults setBool:NO forKey:YLZSiteKey1];
            [YLZDefaults setBool:NO forKey:YLZSiteKey2];
        } else if (switchView.tag == 2) {
            //国家医疗保障局:
            NSString *latitudeString = @"39.92178600";
            NSString *longitudeString = @"116.3473400";
            if (switchView.isOn) {
               [YLZLocationManager shareInstance].coordinate = CLLocationCoordinate2DMake([latitudeString doubleValue], [longitudeString doubleValue]); 
            }
            [YLZDefaults setBool:NO forKey:YLZSiteKey0];
            [YLZDefaults setBool:switchView.isOn forKey:YLZSiteKey1];
            [YLZDefaults setBool:NO forKey:YLZSiteKey2];
        } else {
            //SM城市广场(宝岛眼镜):
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

%new
- (UITableViewCell *)fireTableViewCellWith:(NSString *)cellId withSwitchOn:(BOOL)switchOn withTitleString:(NSString *)titleString withTag:(NSInteger)tag withTableView:(UITableView *)tableView {
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
    // 开关
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

// 返回每一行的cell
- (id)tableView:(id)tableView cellForRowAtIndexPath:(id)indexPath
{

    id view = [(id)self valueForKey:@"delegate"];
    BOOL isDTSettingViewController = [@"DTSettingViewController" isEqualToString:NSStringFromClass([view class])];
    BOOL isOpen = [YLZDefaults boolForKey:YLZKey];
    if (isDTSettingViewController) {
        if ([indexPath section] == 0 || [indexPath section] == 1 || [indexPath section] == 2) {
            return %orig;
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
        return %orig;
    }
}

// 每一行的高度
- (double)tableView:(id)tableView heightForRowAtIndexPath:(id)indexPath
{ 

    id view = [(id)self valueForKey:@"delegate"];
    BOOL isDTSettingViewController = [@"DTSettingViewController" isEqualToString:NSStringFromClass([view class])];
    
    if (isDTSettingViewController) {
        if ([indexPath section] == 0 || [indexPath section] == 1 || [indexPath section] == 2) {
            return %orig;
        } else {
            return 44;
        }
    } else {
        return %orig;
    }
}

// 点击的监听
- (void)tableView:(id)tableView didSelectRowAtIndexPath:(id)indexPath
{
    
    id view = [(id)self valueForKey:@"delegate"];
    BOOL isDTSettingViewController = [@"DTSettingViewController" isEqualToString:NSStringFromClass([view class])];
    if (isDTSettingViewController) {
        if ([indexPath section] == 0 || [indexPath section] == 1 || [indexPath section] == 2) {
            return %orig;
        } else {
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            return; 
        }
    } else {
        return %orig;
    }

}

%end


%hook DTInfoPlist

+ (NSString *)getAppBundleId {
    return @"com.laiwang.DingTalk";
}

%end