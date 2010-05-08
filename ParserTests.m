//
//  ParserTests.m
//  KeePass2
//
//  Created by Qiang Yu on 2/11/10.
//  Copyright 2010 Qiang Yu. All rights reserved.
//

#import "ParserTests.h"
#import "Kdb4Parser.h"
#import "WrapperNSData.h"

@interface ParserTests(PrivateMethods)
-(void)printTree:(Node *)node Indent:(int)indent; 
@end


@implementation ParserTests

- (void) testParse {
	/*WrapperNSData * data = [[WrapperNSData alloc] initWithContentsOfMappedFile:@"/Volumes/Users/qiang/Desktop/utf8.xml"];
	Parser * p = [[Parser alloc]init];
	

	Tree * tree = [p parse:data];
	[ParserTests printTree:tree._root Indent:0];
	[p release];
	[data release];
	 */
}

+(void)printTree:(Node *)node Indent:(int)indent{
	NSMutableString * format = [[NSMutableString alloc]init];
	for (int i=0; i<indent; i++){
		[format appendString:@"\t"];
	}
	
	[format appendString:@"%@"];
	
	NSLog(format, node);
	for(Node * child in node._children){
		[self printTree:child Indent:indent+1];
	}
	[format release];
}

@end
