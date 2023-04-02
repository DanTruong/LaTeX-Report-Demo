# Pull the latest Miktex image.
docker pull miktex/miktex

# Create a volume for Miktex to work with.
docker volume create --name miktex

# Compile the tex file to PDF. This must be run multiple times for the bibliography to appear properly.
docker run -ti -v miktex:/miktex/.miktex -v ${PWD}:/miktex/work miktex/miktex pdflatex 'Evaluating Cloud-Based Gaming Solutions.tex'
docker run -ti -v miktex:/miktex/.miktex -v ${PWD}:/miktex/work miktex/miktex bibtex 'Evaluating Cloud-Based Gaming Solutions'
docker run -ti -v miktex:/miktex/.miktex -v ${PWD}:/miktex/work miktex/miktex pdflatex 'Evaluating Cloud-Based Gaming Solutions.tex'
docker run -ti -v miktex:/miktex/.miktex -v ${PWD}:/miktex/work miktex/miktex pdflatex 'Evaluating Cloud-Based Gaming Solutions.tex'