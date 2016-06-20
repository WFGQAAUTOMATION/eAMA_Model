import random
# from selenium2library import selenium2library
# import selenium


def pick_random_number(topnumber):
    try:
        # available in Python 2.0 and later
        shuffle = random.shuffle
    except AttributeError:
        def shuffle(x):
            for i in xrange(len(x)-1, 0, -1):
                # pick an element in x[:i+1] with which to exchange x[i]
                j = int(random.random() * (i+1))
                x[i], x[j] = x[j], x[i]
    # Assign the range
    cards = range(topnumber)
    # Shuffle the numbers
    shuffle(cards)
    # Return random value
    return cards[:1]


# def click_adopt_and_sign():
#     from selenium.webdriver.remote.webdriver import WebDriver
#     browser = WebDriver()
#     ${var} = modaldialog = browser.FindElement(By.ClassName(""));
#     browser.switch_to_alert().accept()
#     # continue with other stuff here


print pick_random_number(100)

