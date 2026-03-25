#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

echo "~~~~~ MY SALON ~~~~~"
echo ""
echo "Welcome to My Salon, how can I help you?"

# Function to get valid service selection
get_service() {
    while true; do
        # Display services
        $PSQL "SELECT service_id || ') ' || name FROM services ORDER BY service_id" | while IFS="|" read -r sid sname; do
            echo "$sid) $sname"
        done
        
        read SERVICE_ID_SELECTED
        
        # Validate service exists
        SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
        
        if [[ -n "$SERVICE_NAME" ]]; then
            return 0
        else
            echo "I could not find that service. What would you like today?"
        fi
    done
}

# Get valid service
get_service

# Get phone number
echo "What's your phone number?"
read CUSTOMER_PHONE

# Check if customer exists
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

if [[ -z "$CUSTOMER_ID" ]]; then
    # New customer - get name
    echo "I don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    
    # Insert new customer
    $PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')"
    
    # Get the new customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
else
    # Existing customer - get name
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
fi

# Get appointment time
echo "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME

# Insert appointment
$PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')"

# Confirmation message
echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."