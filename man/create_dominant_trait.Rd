% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_dominant_trait.R
\name{create_dominant_trait}
\alias{create_dominant_trait}
\title{Create a trait in which the phenotype is dominant
and the minor allele frequency is known.}
\usage{
create_dominant_trait(
  mafs = 0.25,
  n_snps = 1,
  phenotype_value_recessive = 10,
  phenotype_value_dominant = 11
)
}
\arguments{
\item{mafs}{one or more minor allele frequencies.
These allele frequencies must be ordered decreasingly,
i.e. the MAF is at the first position, where the
even rarer alleles are at the second and third positions.

Note that \code{PLINK} cannot handle triallelic nor
quadallelic SNPs: \code{PLINK} will give a warning that it
is setting the rarest alleles to missing.}

\item{n_snps}{the number of SNPs,
as can be checked by \link{check_n_snps}}

\item{phenotype_value_recessive}{phenotypic value
for the recessive variant, i.e. that genotype that is homozygous for the
rare allele}

\item{phenotype_value_dominant}{phenotypic value
for the dominant variant, i.e. that genotype that has at least one
version of the common common allele}
}
\description{
Create a trait in which the phenotype is dominant
and the minor allele frequency is known.
The phenotype is fully and perfectly determined by the genotype,
see \link{calc_dominant_phenotype_values} for the exact phenotypic values
}
\examples{
create_dominant_trait()
create_dominant_trait(maf = 0.01)
create_dominant_trait(n_snps = 1)
}
\author{
Richèl J.C. Bilderbeek
}
