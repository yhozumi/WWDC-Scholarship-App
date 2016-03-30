//
//  Dynamic-Animator-Bridging-Header.h
//  Yusuke Hozumi
//
//  Created by Suke Hozumi on 3/29/16.
//  Copyright © 2016 Suke Hozumi. All rights reserved.
//

#ifndef Dynamic_Animator_Bridging_Header_h
#define Dynamic_Animator_Bridging_Header_h


#endif /* Dynamic_Animator_Bridging_Header_h */

@import UIKit;

#if DEBUG

@interface UIDynamicAnimator (AAPLDebugInterfaceOnly)

/// Use this property for debug purposes when testing.
@property (nonatomic, getter=isDebugEnabled) BOOL debugEnabled;

@end

#endif