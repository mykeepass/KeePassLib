//
//  AESTests.m
//  KeePass2
//
//  Created by Qiang Yu on 2/21/10.
//  Copyright 2010 Qiang Yu. All rights reserved.
//

#import "AESTests.h"
#import "AESDecryptSource.h"
#import "AESEncryptSource.h"
#import "WrapperNSData.h"

@implementation AESTests

- (void) test{
	char * text = "Hello, this is qiang's AES test! Copyright 2010 Qiang Yu. All rights reserved.";
	uint8_t key[32] = {
		0, 1, 2, 3, 9, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15,
		16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
	};
	
	uint8_t vi[16] = {
		0, 1, 2, 3, 4, 5, 6, 7, 8,
		9, 10, 11, 12, 13, 14, 15
	};
	
	AESEncryptSource * enc = [[AESEncryptSource alloc]init:key andIV:vi];
	NSMutableData * data = [[NSMutableData alloc]initWithCapacity:1024];
	enc._data = data;
	[data release];
	int len = strlen(text);
	//for(int i=0; i<len; i++)
	//	[enc update:text+i size:1];
	//[enc final];
	
	[enc update:text size:len];
	[enc final];
	 NSLog(@"encrypted value: %@", enc._data);

	WrapperNSData * source = [[WrapperNSData alloc] initWithNSData:enc._data];
	AESDecryptSource * dec = [[AESDecryptSource alloc]initWithInputSource:source Keys:key andIV:vi];
/*	uint8_t buffer[32];
	uint32_t read;
	do{
		read = [dec readBytes:buffer length:32];
		for(int i=0; i<read; i++){
			NSLog(@"%c", buffer[i]);
		}
	}while(read);
 */
	[dec release];
	[enc release];
}
@end
