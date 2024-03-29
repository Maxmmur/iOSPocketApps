//
//  SwordModuleTextEntry.h
//  MacSword2
//
//  Created by Manfred Bergmann on 03.10.09.
//  Copyright 2009 Software by MABE. All rights reserved.
//


@interface SwordModuleTextEntry : NSObject {
    NSString *key;
    NSString *text;
}

@property (readwrite, strong) NSString *key;
@property (readwrite, strong) NSString *text;

+ (SwordModuleTextEntry *)textEntryForKey:(NSString *)aKey andText:(NSString *)aText;
- (id)initWithKey:(NSString *)aKey andText:(NSString *)aText;

@end
