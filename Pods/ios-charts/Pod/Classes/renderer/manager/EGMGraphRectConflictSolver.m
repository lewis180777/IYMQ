//
//  EGMGraphRectConflictSolver.m
//  TrainerApp
//
//  Created by Ivan Schuetz on 02/12/14.
//  Copyright (c) 2014 eGym. All rights reserved.
//

#import "EGMGraphRectConflictSolver.h"
#import "EGMGraphDataPointRenderer.h"

@implementation EGMGraphRectConflictSolver

// Conflict solving for rectangular shapes from sinnerschrader's graph implementation (slightly modified)
- (void)solveConflictsForDataPointRenderers:(NSArray *)dataPointRenderers {
    // collect same x values
    NSMutableDictionary *xIndexDict = [[NSMutableDictionary alloc] init];
    for (NSInteger itemIndex = 0; itemIndex < dataPointRenderers.count; itemIndex++) {
        EGMGraphDataPointRenderer *item = dataPointRenderers[itemIndex];
        NSMutableArray *sameXItems = [xIndexDict objectForKey:@([item.dataPoint getXValue].internalScalar)];
        if (!sameXItems) {
            sameXItems = [[NSMutableArray alloc] init];
            [xIndexDict setObject:sameXItems forKey:@([item.dataPoint getXValue].internalScalar)];
        }
        [sameXItems addObject:item];
    }
    
    // re-arrange itemviews
    for (NSNumber *key in xIndexDict) {
        NSMutableArray *sameXItems = [xIndexDict objectForKey:key];
        NSInteger currentItemIndex = 0;
        for (EGMGraphDataPointRenderer *item in sameXItems) {
            //                CGFloat tmpX = originX + ((item.xValue - _internXAxisMinValue)/(_internXAxisMaxValue - _internXAxisMinValue)) * (_internXAxisStepCount * _internXAxisStepWidth);
            
            //                CGFloat tmpX = [item getRect].origin.x; //TODO maybe pointPx
            CGFloat tmpX = item.pointPx.x;
            
            //                EGMGraphItemView *itemView = [sameXItemViews objectAtIndex:currentItemIndex];
            CGRect itemFrame = [item getRect];
            NSInteger prevItemIndex = 0;
            for (EGMGraphDataPointRenderer *prevItem in sameXItems) {
                if (prevItem == item) {
                    break;
                }
                
                //                    EGMGraphItemView *prevItemView = [sameXItemViews objectAtIndex:prevItemIndex];
                CGRect prevRect = [prevItem getRect];
                CGRect intersection = CGRectIntersection(itemFrame, prevRect);
                if (intersection.size.width + intersection.size.height == 0) {
                    prevItemIndex++;
                    continue;
                }
                if (!prevItem.conflictSolved) {
                    item.conflictSolved = YES;
                    //                        itemView.itemAlignment = EGMGraphItemViewAlignmentLeft;
                    itemFrame.origin.x = tmpX;
                    
                    
                    //                        [item setRect:itemFrame];
                    //position item such that x pos of top left corner is at itemFrame.origin.x
                    //we need to add half of width because pointPx for EGMGraphDataPointRectRenderer and EGMGraphDataPointRectWithNoteTextRenderer is at center
                    [item setOrigin: CGPointMake(
                                                 itemFrame.origin.x,
                                                 [item getRect].origin.y
                                                 )];
                    
                    
                    [item setItemAlignement:0];
                    
                    prevItem.conflictSolved = YES;
                    //                        prevItemView.itemAlignment = EGMGraphItemViewAlignmentRight;
                    prevRect.origin.x = tmpX - [prevItem getRect].size.width;
                    
                    //                        [prevItem setRect: prevRect];
                    [prevItem setOrigin: CGPointMake(
                                                     prevRect.origin.x,
                                                     prevRect.origin.y
                                                     )];
                    
                    
                    [prevItem setItemAlignement:1];
                    
                    prevItemIndex++;
                    continue;
                }
                
                // find itemViews in similar (intersected) y Position
                CGRect compareFrame = CGRectMake(0, itemFrame.origin.y, 3000, itemFrame.size.height);
                CGRect unionFrame = itemFrame;
                for (NSInteger nextItemIndex = 0; nextItemIndex < currentItemIndex; nextItemIndex++) {
                    EGMGraphDataPointRenderer *nextItemView = [sameXItems objectAtIndex:nextItemIndex];
                    CGRect nextItemRect = [nextItemView getRect];
                    intersection = CGRectIntersection(nextItemRect, compareFrame);
                    if (intersection.size.width + intersection.size.height != 0) {
                        unionFrame = CGRectUnion(unionFrame, nextItemRect);
                    }
                }
                CGFloat rightWidth = unionFrame.origin.x + unionFrame.size.width - tmpX;
                CGFloat leftWidth = unionFrame.size.width - rightWidth;
                if (leftWidth < rightWidth) {
                    itemFrame.origin.x = unionFrame.origin.x - itemFrame.size.width;
                    
                    //                        [item setRect: itemFrame];
                    [item setOrigin: CGPointMake(
                                                 itemFrame.origin.x,
                                                 [item getRect].origin.y
                                                 )];
                    
                    
                    item.conflictSolved = YES;
                    [item setItemAlignement:1];
                    //                            itemView.itemAlignment = EGMGraphItemViewAlignmentRight;
                } else {
                    itemFrame.origin.x = unionFrame.origin.x + unionFrame.size.width;
                    
                    
                    //                        [item setRect: itemFrame];
                    [item setOrigin: CGPointMake(
                                                 itemFrame.origin.x,
                                                 [item getRect].origin.y
                                                 )];
                    
                    
                    item.conflictSolved = YES;
                    [item setItemAlignement:0];
                    //                            itemView.itemAlignment = EGMGraphItemViewAlignmentLeft;
                }
                break;
            }
            currentItemIndex++;
        }
    }
}


@end
