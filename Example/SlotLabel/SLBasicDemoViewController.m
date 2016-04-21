// SLBasicDemoViewController.m
// Copyright (c) 2016 Pinn Technologies, Inc.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "SLBasicDemoViewController.h"

@implementation SLBasicDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self animate];
    [NSTimer scheduledTimerWithTimeInterval:12
                                     target:self
                                   selector:@selector(animate)
                                   userInfo:nil
                                    repeats:YES];
    [self.slotLabel setNumberOfCharacters:14];
    // Do this stuff after the character amount is set
    self.slotLabel.animationSpeed = 3.0f;
    [self.slotLabel setFont:[UIFont fontWithName:@"Courier" size:35]];
}

- (void)animate
{
    [self.slotLabel animateToString:@"slot label"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.slotLabel animateToString:@"animates"];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.slotLabel animateToString:@"anything"];
    });
}

@end