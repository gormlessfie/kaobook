# README

This is an application that attempts to recreate the core functions of Facebook.
The core features of this application is to be able to add friends and create posts
which are shared amongst your friends.

The posts can be liked and commented on.

I am using this application to get a better understanding of notifications, deeply
associated models, mailer, and ActiveStorage.


------------

Gems used:
 - Devise: Authentication
 - Bulma: CSS styling
 - Font-Awesome-SASS: Icons

  Development:
   - Letter-opener: Email preview.

------------

Future plans (X is completed)

------------
FRIENDSHIPS USERS FRIENDS X
  - HAVE A PAGE DEDICATED TO FRIEND REQUESTS // AMENDED. THERE IS NOW A NOTIFICATION DROPDOWN IN NAVBAR. IT DISPLAYS ALL INCOMING FRIEND REQUESTS.X
  - USER CAN SEE ALL FRIEND REQUESTS ON PAGE X
  - USER CAN ACCEPT/REJECT FRIEND REQUESTS X
    - ACCEPTS CHANGES ACTIVE STATUS TO TRUE X
    - REJECTS DELETES THE FRIENDSHIP. X

USER SHOW PAGE
  - CUSTOM USER SHOW PAGE. DIFFERENT THAN POSTS#INDEX.
    - USER SHOW PAGE ONLY SHOWS YOUR POSTS.
    - USER SHOW PAGE SHOWS YOUR PROFILE.
    - PROFILE IS A CARD WHICH DISPLAYS YOUR NAME. USERNAME. BIRTHDAY. LOCATION?.

  - MOST RECENT TO LEAST RECENT.
  - CREATE DEFAULT POST DURING ACCOUNT CREATION. SHOWS TIME OF ACCOUNT CREATION.

USER PROFILE PAGE
  - PAGE WHERE USER CAN SEE PERSONAL INFORMATION
  - USER CAN DECIDE TO EDIT INFORMATION WITH EDIT LINK
  - USER CAN UPLOAD PROFILE PICTURE <-- EDIT
  - IT WILL HAVE LOOK LIKE TWITTER

EDIT USER PROFILE
  - ADD CSS TO EDIT PAGES
  - DO NOT ALLOW EMAIL EDIT
  - DO EDIT PAGE FOR DETAILS
  - DO EDIT PAGE FOR PROFILE PICTURE

USER AVATAR WITH GRAVATAR
  - INSTALL GRAVITAR
  - LEARN HOW AVATAR WORKS

OMNIAUTH WITH TWITTER AND FACEBOOK
  - ALLOW USERS TO LOG IN THROUGH TWITTER OR FACEBOOK
  - SET UP OMNIAUTH
  - USE INFO FROM OMNIAUTH TO MAKE ACCOUNT

POSTS X
  - COMMENTS X
  - LIKES X
    - A LIKE IS AN ASSOCIATION BETWEEN POST AND USER X
    - POST_ID USER_ID X
    - MAKE USER ONLY ABLE TO LIKE A POST ONCE. X
    - IF NOT LIKE: LIKE, IF LIKED, DELETE THE OBJECT WITH DELETE. X
    - MAKE A METHOD TO CHECK IF USER HAS ALREADY LIKED IT X

NOTIFICATIONS
  - MAKE FLASH MESSAGES LOOK PRETTY
  - MAKE DIFFERENT COLOR BOXES FOR TYPES OF FLASH MESSAGES
  - FLASH MESSAGES CAN BE DELETED WITH X BUTTON

FLASH MESSAGES
  - ATTEMPT TO MAKE IT OVERLAY ON TOP OF THE PAGE
  - DONT LET IT TAKE UP SPACE.
LIKE FEATURE

TESTING WITH GUARD
  - SET UP GUARD FOR UNIT TESTS
    - UNIT TESTS CHECK ASSOCIATIONS
  - SET UP GUARD FOR INTEGRATION TESTS
    - INTEGRATION TEST FOR USER CREATION
    - INTEGRATION TEST FOR POSTING

CANCANCAN SETUP
  - ONLY OWNER CAN MANAGE POSTS
  
SETUP MAILGUN ON HEROKU

//

CHAT

