# Event Manager

This Ruby script manages event attendees, cleans phone numbers, performs time targeting, and day of the week targeting.

## Instructions

1. Install required gems:

    ```bash
    gem install google-api-client
    gem install erb
    ```

2. Set up Google Civic Information API key in the script:

    ```ruby
    civic_info.key = 'YOUR_GOOGLE_API_KEY'
    ```

3. Run the script:
    ```bash
    ruby event_manager.rb
    ```

## Clean Phone Numbers

Phone numbers are cleaned and validated based on specific rules.

- If the phone number is less than 10 digits, it is considered a bad number.
- If the phone number is 10 digits, it is considered good.
- If the phone number is 11 digits and the first digit is 1, trim the 1 and use the remaining 10 digits.
- If the phone number is 11 digits and the first digit is not 1, it is considered a bad number.
- If the phone number is more than 11 digits, it is considered a bad number.

## Time Targeting

- The script extracts registration time and calculates the registration hour.

## Day of the Week Targeting

- The script uses Date#wday to find out the day of the week when most people registered.