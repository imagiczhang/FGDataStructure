//
//  FGHRLinkedList.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 5/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FGHRLinkedListNode;
@interface FGHRLinkedList : NSObject

- (instancetype)initWithHead:(FGHRLinkedListNode *)head;

/**
 *  If you're new to linked lists, this is a great exercise for learning about them. Given a pointer to the head node of a linked list, print its elements in order, one element per line. If the head pointer is null (indicating the list is empty), don’t print anything.
 
 Input Format
 
 The void Print(Node* head) method takes the head node of a linked list as a parameter. Each struct Node has a data field (which stores integer data) and a next field (which points to the next element in the list).
 
 Note: Do not read any input from stdin/console. Each test case calls the Print method individually and passes it the head of a list.
 
 Output Format
 
 Print the integer data for each element of the linked list to stdout/console (e.g.: using printf, cout, etc.). There should be one element per line.
 
 Sample Input
 
 This example uses the following two linked lists:
 
 NULL
 1->2->3->NULL
 NULL
 N
 U
 L
 L
 and Node 1
 N
 o
 d
 e
 
 1
 are the two head nodes passed as arguments to Print(Node* head).
 
 Note: In linked list diagrams, -> describes a pointer to the next node in the list.
 
 Sample Output
 
 1
 2
 3
 Explanation
 
 Test Case 0: NULL. An empty list is passed to the method, so nothing is printed.
 Test Case 1: 1->2->3->NULL. This is a non-empty list so we loop through each element, printing each element's data field on its own line.
 */
- (NSString *)values;

/**
 *  You are given the pointer to the head node of a linked list and an integer to add to the list. Create a new node with the given integer. Insert this node at the tail of the linked list and return the head node. The given head pointer may be null, meaning that the initial list is empty.
 
 Input Format
 You have to complete the Node* Insert(Node* head, int data) method. It takes two arguments: the head of the linked list and the integer to insert. You should not read any input from the stdin/console.
 
 Output Format
 Insert the new node at the tail and just return the head of the updated linked list. Do not print anything to stdout/console.
 
 Sample Input
 
 NULL, data = 2
 2
 
 2
 2
 --> NULL, data = 3
 3
 Sample Output
 
 2 -->NULL
 2 --> 3 --> NULL
 Explanation
 1. We have an empty list, and we insert 2
 2
 .
 2. We start with a 2
 2
 in the tail. When 3
 3
 is inserted, 3
 3
 then becomes the tail.
 */
- (void)insertToTail:(int)data;

/**
 *  You’re given the pointer to the head node of a linked list and an integer to add to the list. Create a new node with the given integer, insert this node at the head of the linked list and return the new head node. The head pointer given may be null meaning that the initial list is empty.
 
 Input Format
 You have to complete the Node* Insert(Node* head, int data) method which takes two arguments - the head of the linked list and the integer to insert. You should NOT read any input from stdin/console.
 
 Output Format
 Insert the new node at the head and return the head of the updated linked list. Do NOT print anything to stdout/console.
 
 Sample Input
 
 NULL , data = 1
 1 --> NULL , data = 2
 
 Sample Output
 
 1 --> NULL
 2 --> 1 --> NULL
 Explanation
 1. We have an empty list, on inserting 1, 1 becomes new head.
 2. We have a list with 1 as head, on inserting 2, 2 becomes the new head.
 */
- (void)insertToHead:(int)data;

/**
 *  You’re given the pointer to the head node of a linked list, an integer to add to the list and the position at which the integer must be inserted. Create a new node with the given integer, insert this node at the desired position and return the head node. A position of 0 indicates head, a position of 1 indicates one node away from the head and so on. The head pointer given may be null meaning that the initial list is empty.
 
 Input Format
 You have to complete the Node* Insert(Node* head, int data, int position) method which takes three arguments - the head of the linked list, the integer to insert and the position at which the integer must be inserted. You should NOT read any input from stdin/console. position will always be between 0 and the number of the elements in the list (inclusive).
 
 Output Format
 Insert the new node at the desired position and return the head of the updated linked list. Do NOT print anything to stdout/console.
 
 Sample Input
 
 NULL, data = 3, position = 0
 3 --> NULL, data = 4, position = 0
 
 Sample Output
 
 3 --> NULL
 4 --> 3 --> NULL
 Explanation
 1. we have an empty list and position 0. 3 becomes head.
 2. 4 is added to position 0, hence 4 becomes head.
 
 Note
 For the purpose of evaluation the list has been initialised with a node with data=2. Ignore it, this is done to avoid printing empty lists while comparing output.
 */
- (void)insert:(int)data toPosition:(int)position;

/**
 *  You’re given the pointer to the head node of a linked list and the position of a node to delete. Delete the node at the given position and return the head node. A position of 0 indicates head, a position of 1 indicates one node away from the head and so on. The list may become empty after you delete the node.
 
 Input Format
 You have to complete the Node* Delete(Node* head, int position) method which takes two arguments - the head of the linked list and the position of the node to delete. You should NOT read any input from stdin/console. position will always be at least 0 and less than the number of the elements in the list.
 
 Output Format
 Delete the node at the given position and return the head of the updated linked list. Do NOT print anything to stdout/console.
 
 Sample Input
 
 1 --> 2 --> 3 --> NULL, position = 0
 1 --> NULL , position = 0
 
 Sample Output
 
 2 --> 3 --> NULL
 NULL
 Explanation
 1. 0th position is removed, 1 is deleted from the list.
 2. Again 0th position is deleted and we are left with empty list.
 */
- (void)deleteInPosition:(int)position;

/**
 *  You are given the pointer to the head node of a linked list and you need to print all its elements in reverse order from tail to head, one element per line. The head pointer may be null meaning that the list is empty - in that case, do not print anything!
 
 Input Format
 You have to complete the void ReversePrint(Node* head) method which takes one argument - the head of the linked list. You should NOT read any input from stdin/console.
 
 Output Format
 Print the elements of the linked list in reverse order to stdout/console (using printf or cout) , one per line.
 
 Sample Input
 
 1 --> 2 --> NULL
 2 --> 1 --> 4 --> 5 --> NULL
 
 Sample Output
 
 2
 1
 5
 4
 1
 2
 Explanation
 1. First list is printed from tail to head hence 2,1
 2. Similarly second list is also printed from tail to head.
 */
- (NSString *)reversedValues;

/**
 *  You’re given the pointer to the head nodes of two linked lists. Compare the data in the nodes of the linked lists to check if they are equal. The lists are equal only if they have the same number of nodes and corresponding nodes contain the same data. Either head pointer given may be null meaning that the corresponding list is empty.
 
 Input Format
 You have to complete the int CompareLists(Node* headA, Node* headB) method which takes two arguments - the heads of the two linked lists to compare. You should NOT read any input from stdin/console.
 
 Output Format
 Compare the two linked lists and return 1 if the lists are equal. Otherwise, return 0. Do NOT print anything to stdout/console.
 
 Sample Input
 
 NULL, 1 --> NULL
 1 --> 2 --> NULL, 1 --> 2 --> NULL
 
 Sample Output
 
 0
 1
 Explanation
 1. We compare an empty list with a list containing 1. They don't match, hence return 0.
 2. We have 2 similar lists. Hence return 1.
 */
- (BOOL)isEqualToHead:(FGHRLinkedListNode *)head;

/**
 *  You’re given the pointer to the head nodes of two sorted linked lists. The data in both lists will be sorted in ascending order. Change the next pointers to obtain a single, merged linked list which also has data in ascending order. Either head pointer given may be null meaning that the corresponding list is empty.
 
 Input Format
 You have to complete the Node* MergeLists(Node* headA, Node* headB) method which takes two arguments - the heads of the two sorted linked lists to merge. You should NOT read any input from stdin/console.
 
 Output Format
 Change the next pointer of individual nodes so that nodes from both lists are merged into a single list. Then return the head of this merged list. Do NOT print anything to stdout/console.
 
 Sample Input
 
 1 -> 3 -> 5 -> 6 -> NULL
 2 -> 4 -> 7 -> NULL
 
 15 -> NULL
 12 -> NULL
 
 NULL
 1 -> 2 -> NULL
 Sample Output
 
 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7
 12 -> 15 -> NULL
 1 -> 2 -> NULL
 Explanation
 1. We merge elements in both list in sorted order and output.
 */
- (void)mergeSortedWithSortedHead:(FGHRLinkedListNode *)head;

/**
 *  You’re given the pointer to the head node of a linked list and a specific position. Counting backwards from the tail node of the linked list, get the value of the node at the given position. A position of 0 corresponds to the tail, 1 corresponds to the node before the tail and so on.
 
 Input Format
 You have to complete the int GetNode(Node* head, int positionFromTail) method which takes two arguments - the head of the linked list and the position of the node from the tail. positionFromTail will be at least 0 and less than the number of nodes in the list. You should NOT read any input from stdin/console.
 
 Constraints
 Position will be a valid element in linked list.
 
 Output Format
 Find the node at the given position counting backwards from the tail. Then return the data contained in this node. Do NOT print anything to stdout/console.
 
 Sample Input
 
 1 -> 3 -> 5 -> 6 -> NULL, positionFromTail = 0
 1 -> 3 -> 5 -> 6 -> NULL, positionFromTail = 2
 Sample Output
 
 6
 3
 */
- (int)nodeValueFromPositionFromTail:(int)position;

/**
 *  You're given the pointer to the head node of a sorted linked list, where the data in the nodes is in ascending order. Delete as few nodes as possible so that the list does not contain any value more than once. The given head pointer may be null indicating that the list is empty.
 
 For now do not be concerned with the memory deallocation. In common abstract data structure scenarios, deleting an element might also require deallocating the memory occupied by it. For an initial intro to the topic of dynamic memory please consult: http://www.cplusplus.com/doc/tutorial/dynamic/
 
 Input Format
 You have to complete the Node* RemoveDuplicates(Node* head) method which takes one argument - the head of the sorted linked list. You should NOT read any input from stdin/console.
 
 Output Format
 Delete as few nodes as possible to ensure that no two nodes have the same data. Adjust the next pointers to ensure that the remaining nodes form a single sorted linked list. Then return the head of the sorted updated linked list. Do NOT print anything to stdout/console.
 
 Sample Input
 
 1 -> 1 -> 3 -> 3 -> 5 -> 6 -> NULL
 NULL
 Sample Output
 
 1 -> 3 -> 5 -> 6 -> NULL
 NULL
 Explanation
 1. 1 and 3 are repeated, and are deleted.
 2. Empty list remains empty.
 */
- (void)removeDuplicates;

/**
 *  You’re given the pointer to the head node of a linked list. Find whether the list contains any cycle (or loop). A linked list is said to contain cycle if any node is re-visited while traversing the list. The head pointer given may be null meaning that the list is empty.
 
 Input Format
 You have to complete the int HasCycle(Node* head) method which takes one argument - the head of the linked list. You should NOT read any input from stdin/console. Number of nodes in a linked list doesn't exceed 100.
 
 Output Format
 Check whether the linked list has a cycle and return 1 if there is a cycle. Otherwise, return 0. Do NOT print anything to stdout/console.
 
 Sample Input
 
 1 --> NULL
 
 1 --> 2 --> 3
 ^     |
 |     |
 -----
 Sample Output
 
 0
 1
 Explanation
 1. First list has no cycle, hence return 0
 2. Second list is shown to have a cycle, hence return 1.
 
 Note
 After first solving the problem by yourself, see Floyd's cycle-finding algorithm for an efficient solution which uses O(N) time and O(1) additional memory.
 */
- (BOOL)hasCycle;

/**
 *  Given pointers to the head nodes of 2
 2
 linked lists that merge together at some point, find the Node where the two lists merge. It is guaranteed that the two head Nodes will be different, and neither will be NULL.
 
 In the diagram below, the two lists converge at Node x:
 
 [List #1] a--->b--->c
 \
 x--->y--->z--->NULL
 /
 [List #2] p--->q
 Complete the int FindMergeNode(Node* headA, Node* headB) method so that it finds and returns the Node where the two lists merge.
 
 Input Format
 
 The FindMergeNode(Node*,Node*) method has two parameters, headA
 h
 e
 a
 d
 A
 and headB
 h
 e
 a
 d
 B
 , which are the non-null head Nodes of two separate linked lists that are guaranteed to converge.
 Do not read any input from stdin/console.
 
 Output Format
 
 Each Node has a data field containing an integer; return the integer data for the Node where the two lists converge.
 Do not write any output to stdout/console.
 
 Sample Input
 
 The diagrams below are graphical representations of the lists that input Nodes headA
 h
 e
 a
 d
 A
 and headB
 h
 e
 a
 d
 B
 are connected to. Recall that this is a method-only challenge; the method only has initial visibility to those 2
 2
 Nodes and must explore the rest of the Nodes using some algorithm of your own design.
 
 Test Case 0
 
 1
 \
 2--->3--->NULL
 /
 1
 Test Case 1
 
 1--->2
 \
 3--->Null
 /
 1
 Sample Output
 
 2
 3
 Explanation
 
 Test Case 0: As demonstrated in the diagram above, the merge Node's data field contains the integer 2
 2
 (so our method should return 2
 2
 ).
 Test Case 1: As demonstrated in the diagram above, the merge Node's data field contains the integer 3
 3
 (so our method should return 3
 3
 ).
 */
- (FGHRLinkedListNode *)findMergeNode:(FGHRLinkedListNode *)head;

@end

@interface FGHRLinkedListNode : NSObject <NSCopying>

@property (nonatomic, strong) FGHRLinkedListNode *next;
@property (nonatomic, assign) int data;

- (instancetype)initWithData:(int)data next:(FGHRLinkedListNode *)next;

@end
