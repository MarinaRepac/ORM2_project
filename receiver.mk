IDIR = include
CC=gcc
CFLAGS= \
	-ggdb\
	-I$(IDIR)\
	-Wall

ODIR=obj
LDIR=lib
BDIR=bin

LIBS= \
	-lm\
	-lpthread\
	-lpcap


_OBJ = \
	receiver.o\
	functions.o\
	packet/custom_header.o\
	packet/eth_header.o\
	packet/ip_header.o\
	packet/udp_header.o\
	packet/packet.o

OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

_DEPS = \
	functions.h\
	packet/custom_header.h\
	packet/eth_header.h\
	packet/ip_header.h\
	packet/udp_header.h\
	packet/packet.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

$(ODIR)/%.o: src/%.c $(BDIR) $(ODIR)
	$(CC) -c -o $@ $< $(CFLAGS)

$(BDIR)/receiver: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(BDIR)/receiver $(ODIR)/*.o *~ core $(INCDIR)/*~

$(ODIR):
	mkdir -p $(ODIR)
	mkdir -p $(ODIR)/packet
$(BDIR):
	mkdir -p $(BDIR)

