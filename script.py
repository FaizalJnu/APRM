import pandas as pd
from datetime import datetime, timedelta
import joblib  # For older versions of scikit-learn
# If you are using scikit-learn version 0.24 or later, use the following instead:
# from joblib import load

# Load the pre-trained model
loaded_model = joblib.load('model.joblib')  # Replace with the actual path to your model file

# Function to convert numerical date to original format
def numerical_to_date(numerical_date):
    base_date = datetime(2023, 1, 1)
    return (base_date + timedelta(days=numerical_date - 1)).strftime("%Y-%m-%d")

# User-selected date
selected_date = "2023-12-15"

# Convert date to numerical
selected_date_numeric = (datetime.strptime(selected_date, "%Y-%m-%d") - datetime(2023, 1, 1)).days + 1

# Features for prediction (replace with your actual features)
selected_features = {
    'Dep_Minute': 30,
    'Dep_hour': 14,
    'Dep_Date_Numerical': selected_date_numeric,
    'Booking Class': 'Economy',
    'Flight number': 'ABC123',
    'Origin': 'CityA',
    'Destination': 'CityB'
}

# Create a DataFrame for prediction
prediction_data = pd.DataFrame([selected_features])

# Use the pre-trained model to predict
predicted_value = loaded_model.predict(prediction_data)

# Add the predicted target variable to the DataFrame
prediction_data['Booking Class Fare USD'] = predicted_value

# Convert numerical date back to original format
prediction_data['Dep_date'] = numerical_to_date(prediction_data['Dep_Date_Numerical'].values[0])

# Save as CSV
prediction_data.to_csv('output.csv', index=False)
