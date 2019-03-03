TARGET=encoder

# exécutables
CC=gcc
LD=gcc


# répertoires source/destination
SRCDIR=src
INCDIR=include
OBJDIR=obj
BINDIR=bin

# liste des fichiers sources et objets
SRC=$(wildcard $(SRCDIR)/*.c)
OBJ=$(SRC:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

all: $(TARGET)
	@echo "make help pour afficher l'aide."

# affiche l'aide
help:
	@echo ""
	@echo "Usage :"
	@echo "make       # compile et crée l'exécutable"
	@echo "make test  # exécute les tests système"
	@echo "make clean # Nettoie le répertoire"

# crée la cible
$(TARGET): $(OBJ)
	mkdir -p $(BINDIR)
	$(LD) $^ -o $(BINDIR)/$@

# compile les fichiers objets
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	mkdir -p $(OBJDIR)
	$(CC) -o $@ -c $<


# exécute les tests système
test: $(TARGET)
	bats test/tests.bats

# nettoie le répertoire
clean:
	rm -R $(OBJDIR)
	rm -R $(BINDIR)

.PHONY: all help test clean
