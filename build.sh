create_deployment
update_deployment in_progress "https://cssac.sujal.dev"

# Build PDF
mkdir -p ./build/usar/
cd src/ || exit
pdflatex -interaction=nonstopmode -output-format=pdf -output-directory=../build/usar/ ./proposal.tex
# Contents page doesn't seem to build properly without compiling a second time.
pdflatex -interaction=nonstopmode -output-format=pdf -output-directory=../build/usar/ ./proposal.tex
cd ../build/usar/ || exit

# Clean up build files
find ./* ! -name "proposal.pdf" -delete

# Build Preview Images
pdftoppm proposal.pdf preview -png

clear_image_cache
update_deployment success
