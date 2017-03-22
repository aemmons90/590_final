**GEOL590 Final Project Proposal

Project Participants:** Alexandra Emmons, Matt Tuttle, and Samantha Coy

**Project Type:** Package

**Git Workflow:** Central Workflow

**Project Description:**

Quantitative sequencing data (qPCR) is a commonly used method to
determine the number of genes or transcripts in a sample of interest.
The common workflow for handling this data starts with normalizing the
data by a sample parameter (e.g. cell number, mass of sample, total
DNA), followed by statistical analyses, and finally, generating a plot
or table for visualizing data trends. These methods are often handled
manually in various software programs that are not self documenting, and
thus cannot be considered as an acceptable method for reproducible data
analysis. Moreover, though a variety of qPCR data normalization packages
currently exist in R (e.g., SLqPCR, EasyqpcR, NormqPCR, and ReadqPCR),
these packages seem to ignore post-processing steps such as statistical
analyses and data visualization. Therefore, we propose the development
of an R package that will streamline the process of qPCR analysis in a
reproducible format, combining both data normalization and
post-processing steps.

**Data Source:** Each contributing member has real world qPCR data that
can be used to develop and test the proposed package.

**Package Specifications:** The proposed package will result in a set of
tools that can be used to produce a normalized data frame from raw qPCR
output, statistical output, and a single plot for data visualization.

**Group Member Roles**: Group members will contribute equally to the
project. Each member will participate in code development and
documentation.
