'''
Name: Erign McCollum,
Description: CSV Read
Input: A catalog csv and user prompted
Output: A file of new catalog
'''
#-------Imports---------------------------------
import sys
import os #for clear screen
import csv
#---------Variables---------------------------------
filename = input("Please enter the file name : ")
lastUpdate = "" #Variable for info on last operation
notSeven = True #bool for while loop
catalog = [] #catalog list
counter = 0 #counter for changes
index = 0 #for search_helper
#-------Class/Function-------------------------------
#Class : Book
#As provided
class Book:
    def __init__(self, price, stock_number, id_number, title, first_name, last_name, pages):
        self.price = price
        self.stock_number = stock_number
        self.id_number = id_number
        self.title = title
        self.first_name = first_name
        self.last_name = last_name
        self.pages = pages
#-------------------------------------------
#Function : Main Menu, Clears the screen, prints the option
# menu, and prints the last update if any
def main_menu():
    os.system('cls' if os.name == 'nt' else 'clear')
    print("===========================")
    print("     Catalog Database")
    print("===========================")
    print("  [1] Insert Book")
    print("  [2] Delete Book")
    print("  [3] Search Database")
    print("  [4] Sort Database")
    print("  [5] Update Database")
    print("  [6] Write File")
    print("  [7] Exit Program)")
    print("===========================")
    print(lastUpdate)
#-------------------------------------------
#Function : one_insert, Updates list, no values returned
def one_insert(catalog):
    global lastUpdate
    global counter
    #Prompts the user for info about a new book:
    ins_price = input("Enter Price: ")
    ins_stock = input("Stock Number: ")
    ins_idnum = input("Enter ID number: ")
    ins_title = input("Enter Title: ")
    ins_fname = input("Enter Author First Name: ")
    ins_lname = input("Enter Author Last Name: ")
    ins_pages = input("Enter Number of Pages: ")
    #Search the database:
    foundBook = False
    for book in catalog:
        if ins_title==book.title:
            foundBook = True #Set to true to skip appending catalog
            #If the book is in database, inc stock_number by 1
            x = int(book.stock_number )+1
            book.stock_number = str(x)
            counter += 1
            lastUpdate = "The total amount in stock is stock_number +1"
    #If not found, insert information into database
    if foundBook==False:
        temp = Book(ins_price,
                    ins_stock,
                    ins_idnum,
                    ins_title,
                    ins_fname,
                    ins_lname,
                    ins_pages)
        catalog.append(temp)
        counter += 1 #increment counter for added book
        lastUpdate = "Book successfully inserted!"
#-------------------------------------------
#Function : delete, search catalog and remove a bok
def two_delete(catalog):
    #Uses search helper
    global index
    global lastUpdate
    global counter
    print("[ i ] Remove book by id")
    print("[ t ] Remove book by title")
    pick = input("Enter operation code: ")
    search_helper(catalog, pick) #calls function to find book
    if index==-1: #If book was not found
        index = 0 #resets index, mostly for testing
        lastUpdate = "Error: book does not exist." #Sets error messages
    else:
        x = int(index.stock_number)-1
        index.stock_number = str(x) #Decrement stock number
        if index.stock_number=="0":
            catalog.remove(index) #Removes if stock=0
            lastUpdate = "Book successfully removed."
        else:
            lastUpdate = "The total amount in stock is stock_number-1."
        counter += 1 #Inc counter for change
#-------------------------------------------
#Function : delete, search catalog and remove a bok
def thr_search(catalog):
    global index
    global lastUpdate
    print("[ i ] Find book by id")
    print("[ t ] Find book by title")
    pick = input("Enter operation code: ")
    search_helper(catalog, pick)
    if index==-1: #If book was not found
        index = 0 #resets index, mostly for testing
        lastUpdate = "Error: book does not exist." #Sets error messages
    else:
        #Prints catalog entry user wanted:
        print("====================Database====================")
        print("Price: $" + index.price)
        print("Stock Number: " + index.stock_number)
        print("ID Number: " + index.id_number)
        print("Title: " + index.title)
        print("Number of Pages: " + index.pages)
        print("Author: " + index.first_name + " " + index.last_name)
        print("================================================")
        #Pause to let user view printout.
        input("Press Enter to Continue.")
#-------------------------------------------
#Function : delete, search catalog and remove a bok
def for_sort(catalog):
    global lastUpdate
    global counter
    print("[ p ] Sort database by price")
    print("[ n ] Sort database by stock number")
    print("[ t ] Sort database by title")
    pick = input("Enter operation code: ")
    #Sorts entire catalog by user choice:
    if pick=="p":
        catalog.sort(key= lambda book: book.price)
    elif pick=="n":
        catalog.sort(key= lambda book: book.stock_number)
    elif pick=="t":
        catalog.sort(key= lambda book: book.title)
    else:
        #Updates and returns to main menu for wrong key
        lastUpdate = "Not a valid option. Sort cancelled."
        return()
    lastUpdate = "Database was successfully sorted."
    counter += 1
#-------------------------------------------
#Function : delete, search catalog and remove a bok
def fiv_update(catalog):
    global lastUpdate
    global index
    global counter
    print("[ i ] Update book by id")
    print("[ t ] Update book by title")
    pick = input("Enter operation code: ")
    search_helper(catalog, pick)
    if index==-1: #If no book found
        index = 0 #reset index (mostly for testing)
        lastUpdate = "Error: book does not exist." #Prints an error
    else:
        print("[ p ] Update Price")
        print("[ s ] Update Stock Number")
        print("[ t ] Update Title")
        print("[ n ] Update Number of Pages")
        pick = input("Enter operation code: ")
        #Changes catalog values at index based on user input:
        if pick=="p":
            upDat = input("Enter new price: ")
            index.price = upDat
        elif pick=="s":
            upDat = input("Enter new stock number: ")
            index.stock_number = upDat
        elif pick=="t":
            upDat = input("Enter new title: ")
            index.title = upDat
        elif pick=="n":
            upDat = input("Enter new number of pages: ")
            index.pages = upDat
        else:
            #Updates and returns to main menu for wrong key
            lastUpdate = "Not a valid option. Update cancelled."
            return()
        #Updates printout:
        counter += 1
        lastUpdate = "Database was successfully updated."
#-------------------------------------------
#Function : write, writes adjusted catalog to newCatalog
def six_write():
    global lastUpdate
    # write to a file using csv.writer()
    write_file = open("newCatalog.txt", "w")
    writer = csv.writer(write_file)
    for book in catalog:
        temp = [book.price,
                book.stock_number,
                book.id_number,
                book.title,
                book.first_name,
                book.last_name,
                book.pages]
        writer.writerow(temp)
    write_file.close()
    lastUpdate = "Write File complete."
#-------------------------------------------
#Function : search_helper, takes user choice and searches database,
#returns -1 if entry not found, otherwise stores in index
def search_helper(catalog, srchChoice):
    global lastUpdate
    global index
    index = -1 #Init index to false
    if srchChoice=="t":
        srchTtl = input("Enter Title: ")
        for book in catalog: #Search catalog in loop
            if srchTtl==book.title:#If book found
                index = book #store book in index
                return(index) #return found book
    elif srchChoice=="i":
        srchId = input("Enter ID number: ")
        for book in catalog: #Search catalog in loop
            if srchId==book.id_number: #If book found
                index = book #store book in index
                return(index) #return found book
#---------Create Catalog---------------------------------
#As provided
# read from a file using csv.reader()
read_file = open(filename, "r")
reader = csv.reader(read_file)
for line in reader:
    temp = Book(line[0],
                line[1],
                line[2],
                line[3],
                line[4],
                line[5],
                line[6])
    catalog.append(temp)
read_file.close()
#---------User Menu---------------------------------
while notSeven:
    main_menu() #Prints menu with bells and whistles
    option = input("Enter operation code : ")
    if option=="1":
        one_insert(catalog)
    elif option=="2":
        two_delete(catalog)
    elif option=="3":
        thr_search(catalog)
    elif option=="4":
        for_sort(catalog)
    elif option=="5":
        fiv_update(catalog)
    elif option=="6":
        six_write()
    elif option=="7":
        #Creates newCatalog and exits:
        print("Changes made to the database: " + str(counter))
        print("Writing changes to newCatalog.csv...")
        six_write()
        print("Exit program.")
        notSeven = False #exit condition
    else:
        #Reinitializes for invalid num
        lastUpdate = "Not a valid selection. Enter 1-7"
