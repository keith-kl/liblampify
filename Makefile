CC    = gcc
LIB   = -lbluetooth
#INC   = -I /usr/include/glib-2.0 -I /usr/lib/glib-2.0/include -I /usr/include/gdk-pixbuf-2.0
INC   = -I /usr/include/glib-2.0 -I /usr/lib/glib-2.0/include
BASE  = lampify
INST  = /usr/local/bin/
CFLAG = -Wall -Ofast

all:
	#$(CC) $(CFLAG) $(INC) $(LIB) -o $(BASE) $(BASE).c
	$(CC) $(CFLAG) -o lampify `pkg-config --cflags glib-2.0` lampify.c `pkg-config --libs glib-2.0` $(LIB)

bin:
	$(CC) $(CFLAG) -fPIC -shared -o liblampify.so `pkg-config --cflags glib-2.0` lampify.c `pkg-config --libs glib-2.0` $(LIB)

clean:
	rm -f $(BASE)

install:
	cp $(BASE) $(INST)$(BASE)
	chmod a+x $(INST)$(BASE)
	setcap 'cap_net_raw,cap_net_admin+eip' $(INST)$(BASE)

uninstall:
	rm -f $(INST)$(BASE)
