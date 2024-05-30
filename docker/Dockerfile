# Start from a base image that has LaTeX and latexmk installed
FROM aergus/latex

# Copy your LaTeX project into the Docker image
COPY src/ /latex
COPY docker/fonts /fonts
COPY docker/latex-rwustyle /styles

# Set the working directory to the directory containing your LaTeX project
WORKDIR /fonts

# Run latexmk with the xelatex option to compile your LaTeX project
RUN dpkg -i fonts-barlow_1.422_all.deb

WORKDIR /styles
RUN make install-home
#RUN latexmk -xelatex Scientific_work_SS2024.tex

WORKDIR /latex
CMD latexmk -xelatex Scientific_work_SS2024.tex


