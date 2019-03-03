TARGET=encoder
UNIT_TEST_TARGET=unit_bin

# exécutables
CC=gcc
LD=gcc


# répertoires source/destination
SRCDIR=src
INCDIR=include
OBJDIR=obj
BINDIR=bin

# liste des fichiers sources et objets
UNIT_TEST_SRC=$(wildcard $(SRCDIR)/*.c)
SRC=$(filter-out $(SRCDIR)/test_%.c, $(UNIT_TEST_SRC))
UNIT_TEST_OBJ=$(UNIT_TEST_SRC:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
OBJ=$(SRC:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

all:
	@echo "make help pour afficher l'aide."
	make $(TARGET)

# affiche l'aide
help:
	@echo ""
	@echo "Usage :"
	@echo "make       # compile et crée l'exécutable"
	@echo "make test  # exécute les tests système"
	@echo "make unit  # exécute les tests unitaires"
	@echo "make clean # Nettoie le répertoire"

# crée la cible
$(TARGET): $(OBJ)
	mkdir -p $(BINDIR)
	$(LD) $^ -o $(BINDIR)/$@

# compile les fichiers objets
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	mkdir -p $(OBJDIR)
	$(CC) -o $@ -c $<

.PHONY: test

# exécute les tests système
test: $(TARGET)
	bats test/global.bats

# exécute les tests unitaires
unit: $(UNIT_TEST_TARGET)
	./$(BINDIR)/$(UNIT_TEST_TARGET)

# crée l'exécutable des tests unitaires
$(UNIT_TEST_TARGET): $(UNIT_TEST_OBJ)
	mkdir -p $(BINDIR)
	$(LD) $^ -o $(BINDIR)/$@

# nettoie le répertoire
clean:
	rm -R $(OBJDIR)
	rm -R $(BINDIR)