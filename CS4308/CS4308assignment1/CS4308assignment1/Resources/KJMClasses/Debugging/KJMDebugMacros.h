//
//  KJMDebugMacros.h
//  FoodRXversionTwo
//
//  Created by Kevin Morton on 1/3/16.
//  Copyright © 2016 KJMProductions. All rights reserved.
//

#ifndef KJMDebugMacros_h
#define KJMDebugMacros_h

#ifndef LLog
#define LLogF(format, ...) NSLog(@"%s:%i: %@", __FILE__, __LINE__, [NSString stringWithFormat:format, ##__VA_ARGS__]);

#ifdef DEBUG
#define LLog(format, ...) LLogF(format, ##__VA_ARGS__);

#define DLog(...)               NSLog(@"%s %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])
#define ALog(...)               [[NSAssertionHandler currentHandler] handleFailureInFunction :[NSString stringWithCString:__PRETTY_FUNCTION__ encoding:NSUTF8StringEncoding] file :[NSString stringWithCString:__FILE__ encoding:NSUTF8StringEncoding] lineNumber : __LINE__ description : __VA_ARGS__]


#else
#define LLog(format, ...) while(0){}
#define DLog(...)               do { } while (0)
#ifndef NS_BLOCK_ASSERTIONS
#define NS_BLOCK_ASSERTIONS
#endif
#define ALog(...)               NSLog(@"%s %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])
#endif
#define ZAssert(condition, ...) do { if (!(condition)) { ALog(__VA_ARGS__); } } while (0)

#endif
#endif
