INSTALL := /usr/bin/install

ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

daemon: daemon.in
	sed 's#%ROOT_DIR%#$(ROOT_DIR)#g' \
		$< > $@

.PHONY: install
install: daemon
	$(INSTALL) --mode=0755 daemon		   /usr/local/bin/patchup
	$(INSTALL) --mode=0644 patchup.service /etc/systemd/system
	systemctl enable patchup

.PHONY: uninstall
uninstall:
	systemctl disable patchup
	$(RM) /etc/systemd/system/patchup.service
	$(RM) /usr/local/bin/patchup

.PHONY: clean
clean:
	$(RM) daemon
