# Predicting fuel economy from vehicle weight in MATLAB

Can a line fitted to 1970s cars predict fuel economy for early 1980s cars?

Extract the project, open `fuel_economy.m` in MATLAB, and press Run. Keep `cars.csv` beside the script. The project uses base MATLAB and runs offline.

The script fits a straight line to 309 cars from model years 1970–79 and tests it on 89 cars from 1980–82. Each additional 1,000 lb corresponded to 6.41 fewer MPG in the training fit. On the later cars, the mean absolute error was 6.81 MPG. Predicting the training average for every car gave an error of 10.96 MPG.

Look at the zero line in the residual plot. The later cars averaged 6.68 MPG above their predictions. Weight helped, but the older cars' weight-to-MPG relationship systematically underestimated fuel economy in the later sample.

## Data

The bundled CSV contains all 398 records and the three fields used in the analysis. Model years are expanded to four digits. The Auto MPG dataset is credited to R. Quinlan (1993), UCI Machine Learning Repository, CC BY 4.0.

- [Kaggle dataset listing](https://www.kaggle.com/datasets/uciml/autompg-dataset)
- [Original dataset and licence](https://archive.ics.uci.edu/dataset/9/auto+mpg)
- [CSV mirror used for the bundled data](https://huggingface.co/datasets/scikit-learn/auto-mpg/blob/main/auto-mpg.csv)
