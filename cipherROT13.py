'''
Name: Erign McCollum, ITE451, Assignment 1
Description: ROT13 Cipher
Input: Command line arguments
Output: Input converted to rot13 cipher text
'''
#-------Imports---------------------------------
import sys #allows for command line arguments usage
#-------Variables-------------------------------
argLen = len(sys.argv) #Var storing # of arguments
args = "" #Var storing all arguments as a string
rotStr = "" #Rotated string to return
#---------Loops---------------------------------
#Loop storing string of arguments minus filename:
for x in range(1,argLen):
    args = args + str(sys.argv[x]) + " "
args = args.upper() #Make input uppercase letters
argLen = len(args)-1 #Store new length
#Loop to convert each char to ascii and "rotate" it:
for x in range(argLen):
    cvtLet = ord(args[x]) #Get int value of char
    if cvtLet != 32 and cvtLet < 78:
        #If char is not a space or < N, add 13:
        cvtLet = cvtLet+13
    elif cvtLet > 77:
        #If char is greater than M, subtract 13:
        cvtLet = cvtLet-13
    #Add new char to string then loop:
    rotStr = rotStr + chr(cvtLet)
#Output rotated string:
print(rotStr)
