SUBDIRS =
DESTDIR =
UBINDIR ?= /usr/bin
LIBDIR ?= /usr/lib
SHAREDIR ?= /usr/share
SBINDIR ?= /sbin
USBINDIR ?= /usr/sbin
BINDIR ?= /bin
LIBEXECDIR ?= /usr/libexec
SYSCONFDIR ?= /etc
SKELDIR ?= /etc/skel
SYSTEMD_UNITDIR ?= $(LIBDIR)/systemd/system
SYSV_INITDIR = /etc/init.d
PROGNAME = sabayon-greeter

all:
	for d in $(SUBDIRS); do $(MAKE) -C $$d; done

clean:
	for d in $(SUBDIRS); do $(MAKE) -C $$d clean; done

install:
	for d in $(SUBDIRS); do $(MAKE) -C $$d install; done

	mkdir -p $(DESTDIR)$(SHAREDIR)/$(PROGNAME)/
	install -Dm755 $(PROGNAME) $(DESTDIR)$(UBINDIR)/$(PROGNAME)
	install -Dm755 $(PROGNAME).desktop $(DESTDIR)$(SHAREDIR)/applications/$(PROGNAME).desktop
	install -Dm755 $(PROGNAME).desktop $(DESTDIR)$(SKELDIR)/.config/autostart/$(PROGNAME).desktop
	cp -r data/* $(DESTDIR)$(SHAREDIR)/$(PROGNAME)/

uninstall:
	rm -rfv $(DESTDIR)$(SHAREDIR)/$(PROGNAME)
	rm -rfv $(DESTDIR)$(UBINDIR)/$(PROGNAME)
	rm -rfv $(DESTDIR)$(SHAREDIR)/applications/$(PROGNAME).desktop
	rm -rfv $(DESTDIR)$(SKELDIR)/.config/autostart/$(PROGNAME).desktop
