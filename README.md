#IdentityVerificationApp README

## Instructions
[Click here](https://gov.blockscore.com/)

* You cannot use a gem or library to calculate geo distance
* You can use a gem to geocode an IP address
* You can be as sophisticated (or not) as you would like to be with the string matching
* You can use whichever request library you are most comfortable with
* The stated spec for your API's return is a set of minimum requirements. You can pass back additional keys if you want

##How to Check Solution:

* Step 1: start the server with 'rails s'
* Step 2: paste the following in command line:

```
curl --data "first_name=Kristy&last_name=Macejkovic&ip_address=204.57.220.1" http://localhost:3000/users
```

This will generate a json response that you can verify.

* Step 3(Optional): You can navigate to

```
http://localhost:3000/users/new
```

Enter the following information:
first name: Kristy
last name: Macejkovic
ip_address: 204.57.220.1

This will either display a json response or display an error message

### My Approach:

1. Retrieve data from the NSA API
-Based on first_name and last_name retrieve the user's object from the NSA API
-Once retrieved, get the lat & long for phone_location and stated_location
-I created a NsaData class that handles making a request and parsing the response to find the person
-I used HTTParty to make the request here
-Also, If the request takes to long, the app raises an error

2. Geocode the person's IP Address to get lat & long
-I created a class Geocoding that uses a third party service to convert an IP address into a lat & long
-I used HTTParty to make the request and then I parsed the response to get lat & long variables

3. Calculate Distance between two points
-Here I used a formula described in the GeoDistance class to calculate distance between two points

4. Creating the User Model
-I created a table less User Model in order to collect all the information into a single object
-After Step 1 through Step 3 executes, I return the User object as JSON


### Resources I refrenced:
1. To calculate distance between two points:
http://www.codecodex.com/wiki/Calculate_distance_between_two_points_on_a_globe#Ruby
2. To Geocode an IP address:
https://freegeoip.net/?q=67.221.169.243
3. Create a tables Model:
http://railscasts.com/episodes/326-activeattr?view=comments
4. Make HTTP requests:
https://github.com/jnunemaker/httparty
