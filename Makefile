
JAVA  = java  -cp bin
JAVAC = javac -cp bin
CF    = clang-format-11 -style=file -i

J = $(shell find src -type f -regex ".+.java$$")

CLASS = $(shell echo $(J) | sed "s/src/bin/g" | sed "s/.java/.class/g")

all: $(CLASS)
	$(JAVA) main

maven:
	mvn compile

bin/%.class: src/%.java
	$(JAVAC) -d bin $< && $(CF) $<

.PHONY: install update
install update:
	sudo apt update
	sudo apt install -u `cat apt.dev apt.txt`
