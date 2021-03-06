# Installation

This page explains how to:

  * Install `plinkr`
  * Install all PLINK versions
  * Install a specific PLINK version
    * Install PLINK v1.7
    * Install PLINK v1.9
    * Install PLINK v2.0
  * Do a custom PLINK installation
    * Install the PLINK versions elsewhere
    * Install the PLINK versions in custom (sub)folders

## Install `plinkr`

`plinkr` is not on CRAN yet. To install `plinkr`:

```
library(remotes)
install_github("richelbilderbeek/plinkr")
```

This assumes you have the `remotes` package installed.

### Install `pgenlibr`

```
remotes::install_github("chrchang/plink-ng/2.0/pgenlibr")
```

## Install all PLINK versions

`plinkr` uses multiple version of PLINK. To install them all:

```
library(plinkr)
install_plinks()
```

Use `get_plink_versions()` to see which versions are supported.

## Install a specific PLINK version

`plinkr` works with multiple versions of `plink` by default.
It is possible to only install a single version:

 * Install PLINK v1.7
 * Install PLINK v1.9
 * Install PLINK v2.0

Use `get_plink_versions()` to see which versions are supported.

### Install PLINK v1.7

To install only PLINK v1.7:

```
library(plinkr)
plink_options <- create_plink_v1_7_options()
install_plink(plink_options = plink_options)
```

Use the same ´plink_options´ when calling PLINK, to call this version of PLINK.

### Install PLINK v1.9

To install only PLINK v1.9:

```
library(plinkr)
plink_options <- create_plink_v1_9_options()
install_plink(plink_options = plink_options)
```

Use the same ´plink_options´ when calling PLINK, to call this version of PLINK.

### Install PLINK v2.0

To install only PLINK v2.0:

```
library(plinkr)
plink_options <- create_plink_v2_0_options()
install_plink(plink_options = plink_options)
```

Use the same ´plink_options´ when calling PLINK, to call this version of PLINK.

## Do a custom PLINK installation

 * Install the PLINK versions elsewhere
 * Install the PLINK versions in custom (sub)folders

### Install the PLINK versions elsewhere

To install all PLINK versions in a different folder,
specify that folder in the `plink_optionses` argument
of `install_plinks`:

```
install_plinks(create_plink_optionses(plink_folder = "my_folder"))
```

This will create the multiple versions if PLINK in the default
subfolders.

### Install the PLINK versions in custom (sub)folders

To install the different PLINK versions in different folder,
specify those folders in the `plink_optionses` argument
of `install_plinks`:

```
plink_optionses <- list(
  create_plink_v1_7_options(plink_folder = "my_folder"),
  create_plink_v1_9_options(plink_folder = "another_folder")
)

install_plinks(plink_optionses)
```

This will create the multiple versions of PLINK,
each in its own custom (sub)folder.

