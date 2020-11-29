# CS350-Asgn2
Group assignment for building interpreter in Mozart

# Team Members: 
Bhanu Krishna Teja - 170564  <br />
Nikhil Naidu - 170758 <br />

# Overview:
This repository contains basic implementation of Oz(Mozart) interpreter. <br />
Stack.oz - Contains basic stack operations on semantic stack. It has the following functions - TopStack, PopStack and PushStack <br />
SingleAssignmentStore.oz - In this file, we implement a new dictionary for local variables in the code. This contains the functions - RetrieveFromSAS BindRefToKeyInSAS BindValueToKeyInSAS AddKeyToSAS <br />
Main.oz - This is the main file which compiles different functions from other oz files and implementing an interpreter for the declarative sequential model for the given **Abstract Syntax Tree**.
Test.oz - This contains sample test cases to test the above interpreter. A test case can be run by  {Inspect {Interpret Test?}}
Unify.oz and ProcessRecords.oz - provided in the Assignment,are uploaded without any modifications.
