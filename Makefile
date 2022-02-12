
PACKAGE = io.github.ponyatov

JAVA  = java  -cp target/classes
JAVAC = javac -cp target/classes
CF    = clang-format-11 -style=file -i

J  = $(shell find src -type f -regex ".+.java$$")
S += $(J)

CLASS = $(shell echo $(J) | sed "s/src.main.java.$(PACKAGE)/target\/classes/g" | sed "s/.java/.class/g")

all: $(CLASS)
	echo $^
#	$(JAVA) main

bin/%.class: target/classes/%.class
	cp $< $@
target/classes/%.class: $(J)
	mvn compile

.PHONY: doxy
doxy: doxy.gen
	doxygen $< 1>/dev/null

.PHONY: install update
install update:
	sudo apt update
	sudo apt install -u `cat apt.dev apt.txt`


MERGE  = Makefile README.md apt.dev apt.txt doxy.gen pom.xml $(S)
MERGE += .vscode bin doc lib src tmp

.PHONY: dev shadow release

dev:
	git push -v
	git checkout $@
	git pull -v
	git checkout shadow -- $(MERGE)
	make doxy && git add docs

shadow:
	git push -v
	git checkout $@
	git pull -v
