# CS-E5710 Bayesian Data Analysis - Project work
## Motivation
- Breast cancer is one of the most common cancer in women around the world. According to American Cancer
Society, about 1 in 8 US women will develop breast cancer in their life time. 
- This shows the importance of early detection of breast cancer in protecting health of women.
Early detection can help physicians and women themselves reduce the health risk and live a happier lives,
not to mention that they can save money from cancer treatment.
## The problem
- Medical screenings are usually done by one doctor, which could be prone to errors and bias. Assessment
from multiple doctors usually yields more reliable diagnosis, but this could be impractical in some cases when
there is a shortage of doctor with the desired skills and experience.
- A computer program for automatic diagnosis of breast cancer could provide a solution to that issue. By
providing prediction from data collected from fine-needle aspirate of breast mass, such program can help
doctors in finalizing their diagnosis and planning better treatments for their patients.
## Modeling idea
- The problem is classifying fine-needle aspirate of breast mass as benign or malignant, which can be modeled
as binary classification problem. In this study, *Gaussian Naive Bayes Classifier and Logistic Regression* will
be employed for this task. These two models have been shown to be very effective in many cases, even with
their simple architectures.
## Data Description 
The dataset, namely [Breast Cancer Wisconsin (Diagnostic)](https://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+(Diagnostic)), is obtained through the UCI Machine Learning Repository. 

According to the source, features are computed from a digitized image of a find needle aspirate (FNA) of a breast mass. They describe characteristics of the cell nuclei present in the image.

There are 10 real-valued features that are computed for each cell nucleus:
- **radius** (mean of distances from center to points on the perimeter)
- **texture** (standard deviation of gray-scale values)
- **perimeter**
- **area**
- **smoothness** (local variation in radius lengths)
- **compactness** (perimeterˆ2 / area - 1.0)
- **concavity** (severity of concave portions of the contour)
- **concave points** (number of concave portions of the contour)
- **symmetry**
- **fractal dimension** (“coastline approximation” - 1)

The target variable is to classify what is the diagnosis of breast tissues (0: malignant, 1: benign) given the available attributes.

## Report
[Data Analysis Report](https://github.com/imkhoa99/CS-E5710-Bayesian-Data-Analysis-Project-work/blob/main/project_khoa.pdf)
