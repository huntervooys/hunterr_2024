![](assets/cover.png)

Good Morning! 😄

This project includes a quarto book and several learnr tutorials. 

## to open this repo in RStudio

From the [repo homepage](https://github.com/huntervooys/hunterr_2024), you can click the green "Code" button and then click to "Open with Github Desktop". Alternatively, you could clone the repository to your machine from the Github Desktop app using the URL.

```
https://github.com/huntervooys/hunterr_2024
```

Once the repository is on you machine, you can double click on the `hunterr_2024.Rproj` file to open the project up in RStudio.

## to open the book

The book has already been built, so you can open it by clicking on any of the `.html` files in the `_book` folder. 

To see the source code for each chapter, you can use the code tools within the book that are described in the preface or else open the `.qmd` files from which the book was rendered.

## to run the tutorials

Currently there is only one tutorial. To run a tutorial, you have to find the `.rmd` file where it is located. Curently, the visualization tutorial is located in the tutorials subdirectory, and the file is called `visualization_tutorial.rmd`. The file name for the tutorial is thus `tutorials/visualization_tutorial.rmd`.

You can either open this file in RStudio and then click the "Run Document" button at the top of the source pane (upper left), or else you can run the following command in the R console (lower left pane in RStudio):

```
learnr::run_tutorial(name = "tutorials/visualization_tutorial.rmd")
```
