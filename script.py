import pandas as pd
from datetime import datetime
import joblib

# User-selected date and time
selected_date = "2023-12-15"
selected_time = "14:30:00"  # HH:MM:SS

model_path = 'gradient_boostingmodel.joblib'
gradient_boosting_model = joblib.load(model_path)

# Convert date and time to numerical
selected_date_numeric = (datetime.strptime(selected_date, "%Y-%m-%d") - datetime(2023, 1, 1)).days + 1
selected_time_numeric = int(selected_time.split(':')[0]) * 60 + int(selected_time.split(':')[1])

# Map Booking Class to int (A->1, B->2, ..., Z->26)
booking_class = 'Economy'
booking_class_numeric = ord(booking_class.upper()) - ord('A') + 1

# Features for prediction
selected_features = {
    'Dep_Minute': selected_time_numeric % 60,
    'Dep_hour': selected_time_numeric // 60,
    'Dep_Date_Numerical': selected_date_numeric,
    'Booking Class': booking_class_numeric,
    'Flight number': 'ABC123',
    'Origin': 'CityA',
    'Destination': 'CityB'
}

# Create a DataFrame for prediction
prediction_data = pd.DataFrame([selected_features])

# Use the pre-trained model to predict
predicted_value = gradient_boosting_model.predict(prediction_data)

# Add the predicted target variable to the DataFrame
prediction_data[' Booking Class Fare USD '] = predicted_value

# Save as CSV
prediction_data.to_csv('output.csv', index=False)

print('DONE')
