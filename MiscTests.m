//
//  Misc.m
//  KeePass2
//
//  Created by Qiang Yu on 1/4/10.
//  Copyright 2010 Qiang Yu. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#include <CommonCrypto/CommonHMAC.h>
#import "MiscTests.h"
#import "ByteBuffer.h"
#import "UUID.h"
#import "Utils.h"
#import "KdbPassword.h"
#import "Kdb3Date.h"

@implementation MiscTests

- (void) testKDB3DateUtil{
	uint8_t date[7];
	date[0]=20; date[1]=10;
	date[2]=12; date[3]=13;
	date[4]=11; date[5]=06; date[6]=15;
	
	uint8_t buffer[5];
	
	[Kdb3Date date:date ToPacked:buffer];
	[Kdb3Date date:date fromPacked:buffer];
	
	[Kdb3Date date:date fromNSDate:[NSDate date]];
	
	for(int i=0; i<7; i++){
		NSLog(@"==>%d", date[i]);
	}
}

- (void) testTransform{

}

@end
