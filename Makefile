NAME=byobu
VERSION=5.2
# Linux = /usr, FreeBSD/OpenBSD = /usr/local, NetBSD = /usr/pkg
PREFIX=/usr
MANPREFIX=${PREFIX}/share/man

install: all
	mkdir -p ${DESTDIR}${PREFIX}/{bin,lib/${NAME},share/${NAME},share/man/man1}
	cp -f bin/* ${DESTDIR}${PREFIX}/bin
	cp -f lib/${NAME}/* ${DESTDIR}${PREFIX}/lib
	cp -f share/${NAME}/* ${DESTDIR}${PREFIX}/share
	chmod 755 ${DESTDIR}${PREFIX}/bin/${NAME}*
	chmod -R 755 ${DESTDIR}${PREFIX}/lib/${NAME}
	cp -f share/man/man1/${NAME}.1 ${DESTDIR}${MANPREFIX}/man1
	chmod 644 ${DESTDIR}${MANPREFIX}/man1/${NAME}.1

dist:
	mkdir ${NAME}-${VERSION}
	cp -r README.md bin share lib Makefile CHANGELOG.md ${NAME}-${VERSION}
	tar zcfv ${NAME}-${VERSION}.tar.gz ${NAME}-${VERSION}
	rm -rf ${NAME}-${VERSION}

uninstall:
	rm -f ${DESTDIOR}${PREFIX}/bin/${NAME}*\
		${DESTDIR}${PREFIX}/lib/${NAME} \
		${DESTDIR}${PREFIX}/share/${NAME} \
		${DESTDIR}${MANPREFIX}/man1/${NAME}.1

.PHONY:install dist uninstall
