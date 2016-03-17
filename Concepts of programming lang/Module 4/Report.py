#!/usr/bin/python

from Book import Book

# Assignment module 4:
# Create a “main program” needs to create a book and then display its contents.

if __name__ == "__main__":

    try:
        book_1 = Book("Kevin Morton", "Book 1", 155)

        title = "\nTitle:\t%s" % book_1.title
        author = "\nAuthor:\t%s" % book_1.author
        pages = "\nPages:\t%s" % book_1.pages

        print(title, author, pages)

    except ValueError as  e:
        print(e.message)
