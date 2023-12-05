#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Exodia OS         #
#                                   #
#####################################

# Compiler and flags #
CC = gcc
CFLAGS = -Wall

# Source files and output binary #
SRC = main.c
OUT = my_program

# Directories #
SRCDIR = src
OBJDIR = obj
BINDIR = bin

# Source file extensions #
SRCEXT = c
OBJEXT = o

# Source files and object files #
SOURCES = $(wildcard $(SRCDIR)/*.$(SRCEXT))
OBJECTS = $(patsubst $(SRCDIR)/%.$(SRCEXT),$(OBJDIR)/%.$(OBJEXT),$(SOURCES))

# Compilation and linking #
all: $(BINDIR)/$(OUT)

$(BINDIR)/$(OUT): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^

$(OBJECTS): $(OBJDIR)/%.$(OBJEXT): $(SRCDIR)/%.$(SRCEXT)
	$(CC) $(CFLAGS) -c -o $@ $<

# Installation #
PREFIX = /usr/local
INSTALL = install

install: $(BINDIR)/$(OUT)
	$(INSTALL) -D $(BINDIR)/$(OUT) $(PREFIX)/bin/$(OUT)

# Clean #
clean:
	rm -f $(BINDIR)/$(OUT) $(OBJECTS)

# Uninstall #
uninstall:
	rm -f $(PREFIX)/bin/$(OUT)

.PHONY: all install clean uninstall
