
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rtutorials: interactive statistics tutorials

<!-- badges: start -->
<!-- badges: end -->

This R package is currently under active development. It provides
interactive `learnr` statistics tutorials, aiming to teach statistics
along with the basics of the R programming language.  
It is in German and written for students of environmental and civil
engineering, to accompany their first statistics lecture.

## Installation

You can install the `rtutorials` package from
[GitHub](https://github.com/) with the help of the `remotes` package,
which you need to install first. Copy the following code into your R
console and hit Enter.

``` r
install.packages("remotes")
remotes::install_github("statistik-lehre/rtutorials")
```

Running this tutorial requires the `learnr` package, which you can
install from CRAN with

``` r
install.packages("learnr")
```

In RStudio, you will see the tutorials pane on the top left. Click there
to select from different tutorials and start them. It might require a R
restart until the tutorials appear.

Alternatively, to list all available tutorials, run

``` r
learnr::available_tutorials(package = "rtutorials")
```

And to run the individual tutorials:

### Einleitung

``` r
learnr::run_tutorial("Einleitung", package = "rtutorials")
```

-   why do we need statistics, why programming languages
-   fist examples of R as a calculator

### Funktionen erkunden

``` r
learnr::run_tutorial("Funktionen erkunden", package = "rtutorials")
```

-   installing and loading packages
-   what is a script? what is a R notebook?
-   playfully learn the structure of function calls with `cowsay::say()`

### Vektoren

``` r
learnr::run_tutorial("Vektoren", package = "rtutorials")
```

-   Learn how to assign content to a variable
-   how to find your variable in the environment
-   what is a vector?
-   combining vectors with `c()`
-   vector based calculations
-   vectorised nature of R
-   Using the colon operator `:`

### Indizierung

``` r
learnr::run_tutorial("Indizierung", package = "rtutorials")
```

-   What is indexing (subsetting)?
-   Subsetting with integer vectors
-   … with logical vectors
-   … with character vectors
-   Using your first conditional statements

### Maße der zentralen Tendenz

``` r
learnr::run_tutorial("Maße der zentralen Tendenz", package = "rtutorials")
```

-   writing your own functions
-   `sum()` and `length()`
-   mode, median, mean

#### tutorials to come:

-   Datenimport
-   Objekte in R verstehen
-   Data Wrangling
-   Visualisierung
-   t-Tests
-   Warum Effektstärke wichtig ist
-   Power berechnen
-   Ab wann sind Daten normalverteilt
-   Chi-Square-Test
-   Korrelation
-   einfache lineare Regression

## Contributing

Feedback and contributions are welcome!

If you spot a typo, some incorrect content or see just a better way to
do it, you are welcome to collaborate. Either report it as an issue or
even better, fix it yourself!

The git part of collab involves cloning the repository to your machine,
creating a new development branch and afterwards, creating a pull
request to integrate the changes.

The content part involves going to `inst/tutorials/…/….Rmd` and editing
it.

## Licensing

All rights are currently reserved to Kassel University, because they are
my employers. However, we are striving to license it with an open source
license.

## Funding

Kassel University, HessenHub
