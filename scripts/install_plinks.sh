#!/bin/bash
#
# Installs multiple version of PLINK
# using the R code in the 'plinkr' package
#
# Because the R code in the package uses 'plinkr::' in calling
# its functions, this script removes these prefixes.
#
# Usage:
#
#  ./scripts/install_plinks.sh
#
#
cat R/*.R > tempscript.R
echo "install_plinks()" >> tempscript.R
echo "install_plink_tutorial_data()" >> tempscript.R
sed -i'.orginal' "s/plinkr:://g" tempscript.R
cat tempscript.R
Rscript tempscript.R
rm tempscript.R
rm tempscript.R.orginal
