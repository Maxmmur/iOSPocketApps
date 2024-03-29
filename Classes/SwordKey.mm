//
//  SwordKey.m
//  MacSword2
//
//  Created by Manfred Bergmann on 17.12.09.
//  Copyright 2009 Software by MABE. All rights reserved.
//

#import "SwordKey.h"


@implementation SwordKey

+ (id)swordKey {
    return [[SwordKey alloc] init];
}

+ (id)swordKeyWithRef:(NSString *)aRef {
    return [[SwordKey alloc] initWithRef:aRef];
}

+ (id)swordKeyWithSWKey:(sword::SWKey *)aSk {
    return [[SwordKey alloc] initWithSWKey:aSk];
}

+ (id)swordKeyWithSWKey:(sword::SWKey *)aSk makeCopy:(BOOL)copy {
    return [[SwordKey alloc] initWithSWKey:aSk makeCopy:copy];    
}

- (id)init {
    return [self initWithRef:nil];
}

- (id)initWithSWKey:(sword::SWKey *)aSk {
    return [self initWithSWKey:aSk makeCopy:NO];
}

- (id)initWithSWKey:(sword::SWKey *)aSk makeCopy:(BOOL)copy {
    self = [super init];
    if(self) {
        if(copy) {
            if(aSk) {
                sk = aSk->clone();            
                created = YES;                
            } else {
                created = NO;
            }
        } else {
            sk = aSk;
            created = NO;
        }
    }    
    return self;    
}

- (id)initWithRef:(NSString *)aRef {
    self = [super init];
    if(self) {
        sk = new sword::SWKey([aRef UTF8String]);
        created = YES;
    }
    
    return self;    
}


- (void)dealloc {
    if(created) {
        delete sk;
    }
    
}

- (id)clone {
    return [SwordKey swordKeyWithSWKey:sk];
}

#pragma mark - Methods

- (void)setPersist:(BOOL)flag {
    sk->setPersist((int)flag);
}

- (BOOL)persist {
    return (BOOL)sk->isPersist();
}

- (int)error {
    return sk->popError();
}

- (void)setPosition:(int)aPosition {
    sk->setPosition(sword::SW_POSITION((char)aPosition));
}

- (void)decrement {
    sk->decrement();
}

- (void)increment {
    sk->increment();
}

- (NSString *)keyText {
    return [NSString stringWithUTF8String:sk->getText()];
}

- (void)setKeyText:(NSString *)aKey {
    sk->setText([aKey UTF8String]);
}

- (sword::SWKey *)swKey {
    return sk;
}

@end
