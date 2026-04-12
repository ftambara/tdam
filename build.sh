#!/bin/bash

# Loop through any directory matching ch*/exercises/
for dir in ch*/exercises/; do
  # Define the target main file for this chapter
  MAIN_FILE="${dir}main.typ"
  
  echo "Generating $MAIN_FILE..."

  # 1. Write the Typst header and template import
  cat << 'EOF' > "$MAIN_FILE"
#import "../../template.typ": assignment

#show: body => assignment(
  "Chapter Exercises", 
  "Federico", 
  body
)

EOF

  # 2. Find all ex*.typ files, sort them by version (to handle 1-10 vs 1-2), 
  # and append them as includes to main.typ
  find "$dir" -maxdepth 1 -name "ex*.typ" -type f | sort -V | while read -r file; do
    # Extract just the filename (e.g., ex1-1.typ)
    filename=$(basename "$file")
    echo "#include \"$filename\"" >> "$MAIN_FILE"
  done

  # 3. Compile the newly generated main.typ to PDF
  echo "Compiling $MAIN_FILE to PDF..."
  typst compile "$MAIN_FILE"
done

echo "Build complete."
