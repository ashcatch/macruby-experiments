//
//  main.m
//  Tea Time
//
//  Created by Rainer Schmid on 19.09.11.
//  Copyright 2011 froglogic GmbH. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
    return macruby_main("rb_main.rb", argc, argv);
}
