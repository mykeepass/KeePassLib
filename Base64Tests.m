//
//  Base64Tests.m
//  KeePass2
//
//  Created by Qiang Yu on 2/27/10.
//  Copyright 2010 Qiang Yu. All rights reserved.
//

#import "Base64Tests.h"
#import "Base64.h"
#import "Arc4RandomStream.h"
#import "WrapperNSData.h"
#import "Salsa20RandomStream.h"

@implementation Base64Tests

- (void) testDecode{
	NSMutableData * data = [[NSMutableData alloc]initWithCapacity:1];
	NSString * v = @"KUv1g8tuYXc="; //@"3O8/bidLjJ4=";
	[Base64 decode:v to:data];
	
	uint8_t pk[] = {
				0x20, 0x4D, 0x6D, 0x92,
				0x86, 0x4A, 0x55, 0x4C,
				0x56, 0x4B, 0xE8, 0xB8, 0x6E, 0x92, 0x6E, 0x07, 0xAB, 0x3E, 
				0xD7, 0x8C, 0x98, 0xC3, 0xB5, 0xA6, 0x9C, 0x14, 0xB3, 0x8D, 0x00, 0x52, 0x46, 0x7A
				 };
	
	Salsa20RandomStream * ars = [[Salsa20RandomStream alloc]init:pk len:32];
	
	NSString * pas = [ars xor:data];
	
	NSLog(@"=====>%@", pas);

	v = @"3O8/bidLjJ4=";
	data = [[NSMutableData alloc]initWithCapacity:1];
	[Base64 decode:v to:data];
	pas = [ars xor:data];	
	NSLog(@"====>%@", pas);	
	
	
	[v release];
	[data release];
}

- (void) testEncode{
}

@end
