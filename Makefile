# Find chapter exercise directories
DIRS := $(wildcard ch*/exercises/)

.PHONY: generate build

# Auto-generate the main.typ files
generate:
	@for dir in $(DIRS); do \
		MAIN_FILE="$${dir}main.typ"; \
		echo "Generating $$MAIN_FILE..."; \
		echo '#import "../../template.typ": assignment, problem' > "$$MAIN_FILE"; \
		echo '#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge' >> "$$MAIN_FILE"; \
		echo '' >> "$$MAIN_FILE"; \
		echo '#show: body => assignment("Chapter Exercises", "Federico", body)' >> "$$MAIN_FILE"; \
		echo '' >> "$$MAIN_FILE"; \
		find "$$dir" -maxdepth 1 -name "ex*.typ" -type f | sort -V | while read -r file; do \
			echo '#[' >> "$$MAIN_FILE"; \
			cat "$$file" >> "$$MAIN_FILE"; \
			echo ']' >> "$$MAIN_FILE"; \
			echo '' >> "$$MAIN_FILE"; \
			echo '' >> "$$MAIN_FILE"; \
		done; \
	done

# Compile the generated main.typ files into PDFs
# The --root . flag allows main.typ to access template.typ
build: generate
	@for dir in $(DIRS); do \
		MAIN_FILE="$${dir}main.typ"; \
		if [ -f "$$MAIN_FILE" ]; then \
			echo "Compiling $$MAIN_FILE to PDF..."; \
			typst compile --root . "$$MAIN_FILE"; \
		fi; \
	done
