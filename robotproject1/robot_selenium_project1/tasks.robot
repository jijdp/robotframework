*** Settings ***
Documentation     Automation testing on 1112 Pizza website;
...               To open main browser and sign in 
...               order pizza from pizza category and proceed to checkout
...               check on chechout page and proceed to payment page  
Library           SeleniumLibrary
Library           RPA.Desktop
Suite Setup       Open Browser        ${URL}   ${BROWSER}
Suite Teardown    Close All Browsers

*** Variables ***
${URL}              https://1112.com/
${BROWSER}          Chrome

*** Test Cases ***
#login as a customer
...    Open 1112 Main Page
...    Go to login icon and open login page
...    Type in email
...    Type in password
...    Submit on login with email button
#Choose a pizza as a signed in customer
...    Open 1112 Main Page as a signed in customer
...    Choose pizza category
...    Add Aloha pizza to my basket
...    Click on my basket icon
...    Proceed to check out page
#Check out with pizza and added item
...    Open check out page with pizza
...    Check and click on upsell button to add on item
...    Scroll down and click on payment button
...    Proceed to payment page
*** Tasks ***
Login
    Maximize Browser Window
    Wait Until Element Is Visible    id:go-to-login 
    Click Element  id:go-to-login
    Sleep          1
    Click Element  id:username
    Input Text     id:username       #add username
    Sleep          0.5
    Click Element  id:password
    Input Text     id:password       #add password
    Sleep          0.5
    Click Element  id:login-email-text
#pizza
    Sleep          1
    Scroll Element Into View    id:home-font
    Click Element     id:category-href
    Click Element     id:add-pza
    Click Element     id:cart-img
    Wait until Element Is Visible    id:checkout-href
    Click Element     id:checkout-href
#would you like anything else and check out
    Sleep          0.5
    Click Element     id:upsell-btn
    Scroll Element Into View    id:to-payment-btn
    Wait Until Element Is Visible    id:to-payment-btn
    Click Element     id:cookies-close
    Click Element     id:to-payment-btn
