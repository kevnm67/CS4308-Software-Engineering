#!/usr/bin/env python

# Kevin Morton


class Book(object):
    def __init__(self, author, title, pages):

        if author is None:
            raise ValueError("invalid author argument")
        if title is None:
            raise ValueError("invalid title argument")
        if pages is None:
            raise ValueError("invalid pages argument")

        self.author = author
        self.title = title
        self.pages = pages


