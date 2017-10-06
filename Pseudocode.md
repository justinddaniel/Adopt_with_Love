Ruby OO CLI Data Gem Project Brainstorming

-I want to scrape from a public website and return useful information in a user CLI.
-First I can decide on purposes and the website I want to scrape from.

Target: Human Society of Southwest Michigan http://humanesocietyswm.org/

Name: “Adopt with Love”

Inspiration/code to mimic: https://github.com/aviflombaum/rubyweekly-cli


How I want my user interface to work:

CLI

1. It greets user “”

2. It asks user if they would like to adopt a 1dog or 2cat

3. gets.input 1 or 2

4. If 1 pull from the website for dogs available
http://humanesocietyswm.org/dogs-for-adoption/

If 2 pull from the website for cats available
http://humanesocietyswm.org/cats-for-adoption/

5. Show list of animal names available -array

6. Prompts user to choose 1 for more information

7. gets input for number, input converted to index, which selects index of array

8. return weblink for profile of animal


Objects needed:
1. CLI controller that is responsible for taking user input and calling the scraper
2. Scraper that responds to user input to scrape the website and return the data