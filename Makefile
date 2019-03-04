# builders
CC=gcc
LD=gcc

# source and destination directories
SRCDIR=src
OBJDIR=obj
BINDIR=bin

# target
TARGET=$(BINDIR)/encoder

# source and object files lists
SRC=$(wildcard $(SRCDIR)/*.c)
OBJ=$(SRC:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

all: $(TARGET)
	@echo "make help to show help."

# show help
help:
	@echo ""
	@echo "Usage :"
	@echo "make       # build target"
	@echo "make test  # run tests"
	@echo "make clean # clean everything"

# build target
$(TARGET): $(OBJ)
	mkdir -p $(BINDIR)
	$(LD) $^ -o $@

# build object files
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	mkdir -p $(OBJDIR)
	$(CC) -o $@ -c $<

# run tests
test: $(TARGET)
	bats test/tests.bats

# clean everything
clean:
	rm -R $(OBJDIR) $(BINDIR) $(DOCDIR)

.PHONY: all help test clean
