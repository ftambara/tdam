== Exercise 1-21

#problem[
  Do all the books you own total at least one million pages? How many total 
  pages are stored in your school library?
]

I don't have many physical books. Let's search for some conservative upper and lower bounds.
I surely must own at least 10 books. I definitely own less than 50 books. No book has more
than 1000 pages. The vast majority, if not all, have more than 100 pages.
This puts the total number of pages between $10 dot 100 = 1000 <= x <= 50 dot 1000 = 50000$.
Even the upper bound is far less than a million. So no, the books I own do not total a million
pages or more.

I have no school and only have vague recollections of going to a library, so I'll have to be even
more conservative.

I'll try to estimate based on library surface area.
First, let's say than in a square meter I can fit a 1-meter wide, 3-meter tall bookshelf.
Let's say the average book is 200 mm tall, 30 mm thick.
We should be able to stick around 6 rows of $1 / (0.03) approx 33$ books,
or around 200 books per bookshelf.

Let me estimate the surface area of a well-known library and search how many floors it has.
The British Library, in London, has an astonishing 14-floor plan, and according to my highly
imprecise Google Maps measurements, the base floor has around 16000 square meters of surface.
Now, not all floors have that kind of surface, but let's just keep it as an upper bound.
This yields 224000 square meters of total surface.
This puts the supposed upper bound of the total number of books at $224000 dot 200 = 44800000$,
that is, 44.8 million books.
I could say that the average book has a thousand pages, but that would be crazy. It's probably closer
to 500. With that number, we get:

$ 44800000 dot 500 = 10000000 dot 448 dot 5 = 2240 dot 10000000 = 22,400,000,000 "pages" $

It seems like the actual figures are closer to 14 million books and 170 million total items,
which includes things like newspapers and so on.
