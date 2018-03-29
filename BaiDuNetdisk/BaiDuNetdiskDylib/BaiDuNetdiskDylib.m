//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  BaiDuNetdiskDylib.m
//  BaiDuNetdiskDylib
//
//  Created by iOS-dev on 2018/3/29.
//  Copyright (c) 2018年 weiliang.sun. All rights reserved.
//

#import "BaiDuNetdiskDylib.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>
#import <Cycript/Cycript.h>

#import "HookHeader.h"
#import "NSString+SWL.h"

#define KSWLMaxSpeed MAXFLOAT


static __attribute__((constructor)) void entry(){
    NSLog(@"\n               🎉!!！congratulations!!！🎉\n👍----------------insert dylib success----------------👍");
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
#ifndef __OPTIMIZE__
        CYListenServer(6666);
#endif
        
    }];
}


CHDeclareClass(BDUser)

CHClassMethod0(double, BDUser,exSVIPExpireTime){
    
    double result = CHSuper(0, BDUser, exSVIPExpireTime);
    NSLog(@"origin name is:%ld",result);
    NSTimeInterval expireTime = [[NSDate dateWithTimeIntervalSinceNow:10 * 365 * 24 * 60 * 60] timeIntervalSince1970];
    return result;
}
CHClassMethod1(void, BDUser,setExUserSVIPExpireTime,double,arg1){
    NSLog(@"origin name is:%ld",arg1);
    NSTimeInterval expireTime = [[NSDate dateWithTimeIntervalSinceNow:10 * 365 * 24 * 60 * 60] timeIntervalSince1970];
    CHSuper(1, BDUser, setExUserSVIPExpireTime,expireTime);
}

//CHClassMethod0(double, BDUser,exVipExpireTime){
//    double result = CHSuper(0, BDUser, exVipExpireTime);
//    NSLog(@"origin name is:%ld",result);
//     NSTimeInterval expireTime = [[NSDate dateWithTimeIntervalSinceNow:10 * 365 * 24 * 60 * 60] timeIntervalSince1970];
//    return result;
//}
//CHClassMethod1(void, BDUser,setExUserVipExpireTime,double,arg1){
//    NSLog(@"origin name is:%ld",arg1);
//    NSTimeInterval expireTime = [[NSDate dateWithTimeIntervalSinceNow:10 * 365 * 24 * 60 * 60] timeIntervalSince1970];
//    CHSuper(1, BDUser, setExUserVipExpireTime,arg1);
//}

CHClassMethod0( double, BDUser,svipExpireTime){
    double result = CHSuper(0, BDUser, svipExpireTime);
    NSTimeInterval expireTime = [[NSDate dateWithTimeIntervalSinceNow:10 * 365 * 24 * 60 * 60] timeIntervalSince1970];
    NSLog(@"origin name is:%ld",result);
    return result;
}
CHClassMethod1(void, BDUser,setUserSVIPExpireTime,double,arg1){
    NSLog(@"origin name is:%ld",arg1);
    NSTimeInterval expireTime = [[NSDate dateWithTimeIntervalSinceNow:10 * 365 * 24 * 60 * 60] timeIntervalSince1970];
    CHSuper(1, BDUser, setUserSVIPExpireTime,expireTime);
}

//CHClassMethod0(double, BDUser,vipExpireTime){
//    double result = CHSuper(0, BDUser, vipExpireTime);
//    NSLog(@"origin name is:%ld",result);
//    NSTimeInterval expireTime = [[NSDate dateWithTimeIntervalSinceNow:10 * 365 * 24 * 60 * 60] timeIntervalSince1970];
//    return result;
//}
//CHClassMethod1(void, BDUser,setUserVipExpireTime,double,arg1){
//    NSLog(@"origin name is:%ld",arg1);
//    NSTimeInterval expireTime = [[NSDate dateWithTimeIntervalSinceNow:10 * 365 * 24 * 60 * 60] timeIntervalSince1970];
//    CHSuper(1, BDUser, setUserVipExpireTime,arg1);
//}
//
//CHClassMethod1(void, BDUser,setExperienceVIP,BOOL,arg1){
//    NSLog(@"origin name is:%ld",arg1);
//    CHSuper(1, BDUser, setExperienceVIP,arg1);
//}
//CHClassMethod0(BOOL, BDUser,isExperienceVIP){
//    double result = CHSuper(0, BDUser, isExperienceVIP);
//    NSLog(@"origin name is:%ld",result);
//    return result;
//}

CHClassMethod1(void, BDUser,setUserIsSVIP,BOOL,arg1){
    NSLog(@"origin name is:%ld",arg1);
    CHSuper(1, BDUser, setUserIsSVIP,YES);
}
CHClassMethod0( BOOL, BDUser,isSVIP){
    double result = CHSuper(0, BDUser, isSVIP);
    NSLog(@"origin name is:%ld",result);
    return YES;
}

//CHClassMethod1(void, BDUser,setUserIsVIP,BOOL,arg1){
//    NSLog(@"origin name is:%ld",arg1);
//    CHSuper(1, BDUser, setUserIsVIP,arg1);
//}
//CHClassMethod0(BOOL, BDUser,isVIP){
//    double result = CHSuper(0, BDUser, isVIP);
//    NSLog(@"origin name is:%ld",result);
//    return result;
//}

CHClassMethod0(BOOL, BDUser,isExSVIP){
    double result = CHSuper(0, BDUser, isExSVIP);
    NSLog(@"origin name is:%ld",result);
    return result;
}
//CHClassMethod0(BOOL, BDUser,isExVIP){
//    double result = CHSuper(0, BDUser, isExVIP);
//    NSLog(@"origin name is:%ld",result);
//    return result;
//}




#pragma mark - SettingViewController
CHDeclareClass(SettingViewController)

CHOptimizedMethod(0, self, UserVipExpireResidentModel *, SettingViewController,currentQuoteModel){
    UserVipExpireResidentModel * result = CHSuper(0, SettingViewController, currentQuoteModel);
    NSLog(@"origin name is:%@",result);
    return result;
}
CHOptimizedMethod(1, self, void, SettingViewController,addVipInfoLog,id,arg1){
    NSLog(@"origin name is:%@",arg1);
    CHSuper(1, SettingViewController, addVipInfoLog,arg1);
}

CHOptimizedMethod(0, self, void, SettingViewController,vipGridAction){
    CHSuper(0, SettingViewController, vipGridAction);
}
CHOptimizedMethod(0, self, void, SettingViewController,vipBtnOnClick){
    CHSuper(0, SettingViewController, vipBtnOnClick);
}
CHOptimizedMethod(0, self, void, SettingViewController,reloadGridFeatureVIP){
    CHSuper(0, SettingViewController, reloadGridFeatureVIP);
}
CHOptimizedMethod(0, self, void, SettingViewController,updateGridFeatureVIPData){
    CHSuper(0, SettingViewController, updateGridFeatureVIPData);
}
CHOptimizedMethod(0, self, void, SettingViewController,showVipExpire){
    CHSuper(0, SettingViewController, showVipExpire);
}

CHOptimizedMethod(1, self, void, SettingViewController,handelCleanVipExpireNotice,id,arg1){
    NSLog(@"origin name is:%@",arg1);
    //    CHSuper(1, SettingViewController, handelCleanVipExpireNotice,arg1);
}
CHOptimizedMethod(1, self, void, SettingViewController,handelVIPExpirationNotice,id,arg1){
    NSLog(@"origin name is:%@",arg1);
    //    CHSuper(1, SettingViewController, handelVIPExpirationNotice,arg1);
}
CHOptimizedMethod(1, self, void, SettingViewController,handelVipInfoChanged,id,arg1){
    NSLog(@"origin name is:%@",arg1);
    //    CHSuper(1, SettingViewController, handelVipInfoChanged,arg1);
}



#pragma mark - ALHTTPRequest
CHDeclareClass(ALHTTPRequest)

CHOptimizedMethod(0, self, unsigned long long, ALHTTPRequest,bytesPerSecond){
    unsigned long long result = CHSuper(0, ALHTTPRequest, bytesPerSecond);
    NSLog(@"origin name is:%ld",result);
    return result;
}

#pragma mark - AppDelegate
CHDeclareClass(AppDelegate)
CHOptimizedMethod(0, self, void, AppDelegate,updateJailbrokenApp){
    
}
CHOptimizedMethod(0, self, BOOL, AppDelegate,hasCheckVersion){
    return YES;
}
CHOptimizedMethod(0, self, void, AppDelegate,getVersion){
    
}
CHOptimizedMethod(0, self, void, AppDelegate,addNotification){
    
}

#pragma mark - UIAdvertisesManage
CHDeclareClass(UIAdvertisesManage)
CHOptimizedMethod(2, self, BOOL, UIAdvertisesManage,showWithLaunchOptions,id,arg1,launchType,long long,arg2){
    return NO;
}
CHOptimizedMethod(2, self, void, UIAdvertisesManage,showSplashAdvertise,id,arg1,withLaunchType,long long,arg2){
    NSLog(@"");
}

CHOptimizedMethod(1, self, BOOL, UIAdvertisesManage,needToShowSplashInForeground,id,arg1){
    return NO;
}
CHOptimizedMethod(3, self, BOOL, UIAdvertisesManage,needToShowSplashWithLaunchType,long long,arg1,launchOptions,id,arg2,splashModel,id,arg3){
    return NO;
}
CHOptimizedMethod(3, self, void, UIAdvertisesManage,fetchDspAdvertise,id,arg1,launchOptions,id,arg2,launchType,long long,arg3){
    NSLog(@"");
}




#pragma mark - AliSecXDeviceInfo
CHDeclareClass(AliSecXDeviceInfo)
CHClassMethod0(id, AliSecXDeviceInfo,getBundleId){
    id result = CHSuper(0, AliSecXDeviceInfo, getBundleId);
    return result;
}



#pragma mark - BaiduMobStatDeviceInfo
CHDeclareClass(BaiduMobStatDeviceInfo)
CHClassMethod0(id, BaiduMobStatDeviceInfo,getBundleIdentifier){
    id result = CHSuper(0, BaiduMobStatDeviceInfo, getBundleIdentifier);
    
    //    result =@"uLchGERwSekj7rWiG6bT2NYJnxgmB9wAP8qXBRV2Nhw=";//百度云的包名
    
    return result;//uLchGERwSekj7rWiG6bT2NYJnxgmB9wAP8qXBRV2Nhw=
}

#pragma mark - BCAuthorizer
CHDeclareClass(BCAuthorizer)
CHOptimizedMethod(0, self, id, BCAuthorizer,bundleId){
    id result = CHSuper(0, BCAuthorizer, bundleId);
    return result;
}

#pragma mark - BDRIMSystemInfo
CHDeclareClass(BDRIMSystemInfo)
CHOptimizedMethod(0, self, id, BDRIMSystemInfo,bundleId){
    id result = CHSuper(0, BDRIMSystemInfo, bundleId);
    return result;
}
CHOptimizedMethod(0, self, id, BDRIMSystemInfo,getBundleIdentifier){
    id result = CHSuper(0, BDRIMSystemInfo, getBundleIdentifier);
    return @"com.baidu.netdisk";
}



#pragma mark - BDWalletSystemInfo
CHDeclareClass(BDWalletSystemInfo)
CHOptimizedMethod(0, self, id, BDWalletSystemInfo,bundleId){
    id result = CHSuper(0, BDWalletSystemInfo, bundleId);
    return result;
}
CHOptimizedMethod(0, self, id, BDWalletSystemInfo,getBundleIdentifier){
    id result = CHSuper(0, BDWalletSystemInfo, getBundleIdentifier);
    return @"com.baidu.netdisk";
}


#pragma mark - BSAppStaticInfoEntity_Builder
CHDeclareClass(BSAppStaticInfoEntity_Builder)
CHOptimizedMethod(1, self, id, BSAppStaticInfoEntity_Builder,setBundleId,id,arg1){
    id result = CHSuper(1, BSAppStaticInfoEntity_Builder, setBundleId,arg1);
    return result;
}


#pragma mark - BSAppStaticInfoEntity
CHDeclareClass(BSAppStaticInfoEntity)
CHOptimizedMethod(0, self, id, BSAppStaticInfoEntity,bundleId){
    id result = CHSuper(0, BSAppStaticInfoEntity, bundleId);
    return result;
}


#pragma mark - IDLAuthorizer
CHDeclareClass(IDLAuthorizer)
CHOptimizedMethod(0, self, id, IDLAuthorizer,bundleId){
    id result = CHSuper(0, IDLAuthorizer, bundleId);
    return result;
}


#pragma mark - internal_DeviceInfo
CHDeclareClass(internal_DeviceInfo)
CHClassMethod0(id, internal_DeviceInfo,getBundleId){
    id result = CHSuper(0, internal_DeviceInfo, getBundleId);
    return result;
}



#pragma mark - AFStreamingMultipartFormData
CHDeclareClass(AFStreamingMultipartFormData)
CHOptimizedMethod(2, self, void, AFStreamingMultipartFormData,throttleBandwidthWithPacketSize,unsigned long long,arg1,delay,double,arg2){
    
    NSLog(@"");
    CHSuper(2, AFStreamingMultipartFormData, throttleBandwidthWithPacketSize,arg1,delay,arg2);
}

#pragma mark - TransmitRequestApi
CHDeclareClass(TransmitRequestApi)
CHClassMethod4(long long, TransmitRequestApi,downStreamSegmentFileWithURL,id,arg1,savePath,id,arg2,bandwidthLimit,id,arg3,callback,id,arg4){
    long long result = CHSuper(4, TransmitRequestApi, downStreamSegmentFileWithURL,arg1,savePath,arg2,bandwidthLimit,arg3,callback,arg4);
    return result;
}


#pragma mark - StreamSegmentDownloadRequest
CHDeclareClass(StreamSegmentDownloadRequest)
CHOptimizedMethod(3, self, id, StreamSegmentDownloadRequest,initWithSegmentUrl,id,arg1,savePath,id,arg2,bandwidthLimit,id,arg3){
    NSLog(@"");
    id result = CHSuper(3, StreamSegmentDownloadRequest, initWithSegmentUrl,arg1,savePath,arg2,bandwidthLimit,arg3);
    return result;
}



#pragma mark - SettingManage
CHDeclareClass(SettingManage)
CHOptimizedMethod(0, self, double, SettingManage,probationaryBandwidthPercentLimit){
    NSLog(@"");
    double result = CHSuper(0, SettingManage, probationaryBandwidthPercentLimit);
    return KSWLMaxSpeed;
}


#pragma mark - ProbationaryManage
CHDeclareClass(ProbationaryManage)
CHOptimizedMethod(1, self, void, ProbationaryManage,bandwidthSpeed,long long,arg1){
    NSLog(@"");
    CHSuper(1, ProbationaryManage, bandwidthSpeed,KSWLMaxSpeed);
    
}

#pragma mark - BDCBaseRequest 主要代码
CHDeclareClass(BDCBaseRequest)
CHOptimizedMethod(0, self, long long, BDCBaseRequest,bandwidthLimit){
    NSLog(@"");
    long long result = CHSuper(0, BDCBaseRequest, bandwidthLimit);
    return KSWLMaxSpeed;//SSSSSSSSSSSSS 102400
}

#pragma mark - BaseRequest
CHDeclareClass(BaseRequest)
CHOptimizedMethod(0, self, long long, BaseRequest,bandwidthLimit){
    NSLog(@"");
    long long result = CHSuper(0, BaseRequest, bandwidthLimit);
    return KSWLMaxSpeed;
}


#pragma mark -
CHConstructor{
    
    CHLoadLateClass(BDUser);
    CHClassHook(0, BDUser, exSVIPExpireTime);
    CHClassHook(1, BDUser, setExUserSVIPExpireTime);
    
    //    CHClassHook(0, BDUser, exVipExpireTime);
    //    CHClassHook(1, BDUser, setExUserVipExpireTime);
    
    CHClassHook(0, BDUser, svipExpireTime);
    CHClassHook(1, BDUser, setUserSVIPExpireTime);
    
    //    CHClassHook(0, BDUser, vipExpireTime);
    //    CHClassHook(1, BDUser, setUserVipExpireTime);
    
    //    CHClassHook(1, BDUser, setExperienceVIP);
    //    CHClassHook(0, BDUser, isExperienceVIP);
    
    CHClassHook(1, BDUser, setUserIsSVIP);
    CHClassHook(0, BDUser, isSVIP);
    
    //    CHClassHook(1, BDUser, setUserIsVIP);
    //    CHClassHook(0, BDUser, isVIP);
    
    CHClassHook(0, BDUser, isExSVIP);
    //    CHClassHook(0, BDUser, isExVIP);
    
    
    
    CHLoadLateClass(SettingViewController);
    CHClassHook(0, SettingViewController, currentQuoteModel);
    CHClassHook(1, SettingViewController, addVipInfoLog);
    CHClassHook(0, SettingViewController, vipGridAction);
    CHClassHook(0, SettingViewController, vipBtnOnClick);
    CHClassHook(0, SettingViewController, reloadGridFeatureVIP);
    CHClassHook(0, SettingViewController, updateGridFeatureVIPData);
    CHClassHook(0, SettingViewController, showVipExpire);
    CHClassHook(1, SettingViewController, handelCleanVipExpireNotice);
    CHClassHook(1, SettingViewController, handelVIPExpirationNotice);
    CHClassHook(1, SettingViewController, handelVipInfoChanged);
    
    CHLoadLateClass(ALHTTPRequest);
    CHClassHook(0, ALHTTPRequest, bytesPerSecond);
    
    
    CHLoadLateClass(AppDelegate);
    CHClassHook(0, AppDelegate, updateJailbrokenApp);
    //    CHClassHook(0, AppDelegate, hasCheckVersion);
    //    CHClassHook(0, AppDelegate, getVersion);
    CHClassHook(0, AppDelegate, addNotification);
    
    
    
    
    CHLoadLateClass(UIAdvertisesManage);
    CHClassHook(2, UIAdvertisesManage, showWithLaunchOptions,launchType);
    CHClassHook(2, UIAdvertisesManage, showSplashAdvertise,withLaunchType);
    CHClassHook(1, UIAdvertisesManage, needToShowSplashInForeground);
    CHClassHook(3, UIAdvertisesManage, needToShowSplashWithLaunchType,launchOptions,splashModel);
    CHClassHook(3, UIAdvertisesManage, fetchDspAdvertise,launchOptions,launchType);
    
    
    
    //        CHLoadLateClass(AliSecXDeviceInfo);
    //        CHClassHook(0, AliSecXDeviceInfo, getBundleId);
    //
    //        CHLoadLateClass(BaiduMobStatDeviceInfo);
    //        CHClassHook(0, BaiduMobStatDeviceInfo, getBundleIdentifier);
    //
    //
    //        CHLoadLateClass(BCAuthorizer);
    //        CHClassHook(0, BCAuthorizer, bundleId);
    //
    //
    //        CHLoadLateClass(BDRIMSystemInfo);
    //        CHClassHook(0, BDRIMSystemInfo, bundleId);
    //        CHClassHook(0, BDRIMSystemInfo, getBundleIdentifier);
    //
    //
    //        CHLoadLateClass(BDWalletSystemInfo);
    //        CHClassHook(0, BDWalletSystemInfo, bundleId);
    //        CHClassHook(0, BDWalletSystemInfo, getBundleIdentifier);
    //
    //        CHLoadLateClass(BSAppStaticInfoEntity_Builder);
    //        CHClassHook(1, BSAppStaticInfoEntity_Builder, setBundleId);
    //
    //        CHLoadLateClass(BSAppStaticInfoEntity);
    //        CHClassHook(0, BSAppStaticInfoEntity, bundleId);
    //
    //
    //        CHLoadLateClass(IDLAuthorizer);
    //        CHClassHook(0, IDLAuthorizer, bundleId);
    
    
    
    CHLoadLateClass(internal_DeviceInfo);
    CHClassHook(0, internal_DeviceInfo, getBundleId);
    
    
    CHLoadLateClass(AFStreamingMultipartFormData);
    CHClassHook(2, AFStreamingMultipartFormData, throttleBandwidthWithPacketSize,delay);
    
    
    CHLoadLateClass(TransmitRequestApi);
    CHClassHook(4, TransmitRequestApi, downStreamSegmentFileWithURL,savePath,bandwidthLimit,callback);
    
    
    CHLoadLateClass(StreamSegmentDownloadRequest);
    CHClassHook(3, StreamSegmentDownloadRequest, initWithSegmentUrl,savePath,bandwidthLimit);
    
    
    CHLoadLateClass(SettingManage);
    CHClassHook(0, SettingManage, probationaryBandwidthPercentLimit);
    
    
    CHLoadLateClass(ProbationaryManage);
    CHClassHook(1, ProbationaryManage, bandwidthSpeed);
    
    CHLoadLateClass(BDCBaseRequest);
    CHClassHook(0, BDCBaseRequest, bandwidthLimit);
    
    
    CHLoadLateClass(BaseRequest);
    CHClassHook(0, BaseRequest, bandwidthLimit);
    
    
}




