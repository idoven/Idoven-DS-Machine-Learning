# ECG Classification Project - Idoven

This project uses ECG signals to train classification models and predict cardiac diseases. The main objective is to explore several tecniques to process, clean, and classify ECGs using Machine Learning techniques.

## Project Structure

The project is organised into the following folders:

- **models/**: Contains the trained models used in the project.
- **extra_data/**: Stores additional data, such as filtered ECGs and extracted features from the signals (e.g., `filtered_ecgs`, `extra_features`).

In addition to the already present **data/** folder

## Notebook Content

The notebook performs the following main tasks:

1. **Library Import**: Libraries such as `wfdb`, `neurokit2`, `tensorflow`, `xgboost`, and several from `sklearn` are used for signal processing and classification.
2. **Data Loading**: The ECG data is loaded and prepared following the recommendations of PhysioNet.
3. **ECG Processing**: Cleaning and filtering techniques are applied using `neurokit2` to obtain cleaner signals and useful features.
4. **Feature Extraction**: Relevant features from the ECGs are extracted and added to a structured dataset.
5. **Model Training**: Machine Learning models such as neural networks with Keras and `XGBoost` are used to train classifiers.
6. **Evaluation**: Metrics such as AUC, accuracy, and ROC curves are used to evaluate the performance of the models.

(The last three steps are iteratively done with each of the developed ideas.)

## Requirements

The main dependencies to run this notebook include:

- Python 3.7+
- TensorFlow
- Keras
- XGBoost
- NeuroKit2
- Scikit-learn
- Matplotlib
- Seaborn
- WFDB

These dependencies can be installed by running:

```bash
pip install -r requirements.txt
```

## Data

Additional data, such as filtered ECGs and features, can be found in the `extra_data/` folder, although they can also be obtained and computed during the code execution. This includes the files `filtered_ecgs` and `extra_features`, which require some time to be executed and can be loaded more quickly from this folder.

## Models

The trained models are stored in the models/ folder. These models can be loaded and used directly for making predictions without the need to retrain them.