//
//  RandomStreamTest.m
//  KeePass2
//
//  Created by Qiang Yu on 2/28/10.
//  Copyright 2010 Qiang Yu. All rights reserved.
//

#import "RandomStreamTest.h"
#import "Arc4RandomStream.h"
#import "Salsa20RandomStream.h"
@implementation RandomStreamTest

- (void) testArc4{
	/*uint8_t key[] = {1, 2, 0xa, 4, 5, 6, 7, 8, 9, 0};
	Arc4RandomStream * rs = [[Arc4RandomStream alloc]init:key len:10];
	uint8_t buffer[32];
	[rs readBytes:buffer length:32];
	for(int i=0; i<32; i++){
		NSLog(@">> %d", buffer[i]);
	}*/
}

- (void)testSalsa{
/*	uint8_t key[] = {1, 2, 0xa, 4, 5, 6, 7, 8, 9, 0};
	 Salsa20RandomStream * rs = [[Salsa20RandomStream alloc]init:key len:10];
	 uint8_t buffer[32];
	 [rs readBytes:buffer length:32];
	 for(int i=0; i<32; i++){
		 NSLog(@">> %d", buffer[i]);
	 }
 */
}

@end
