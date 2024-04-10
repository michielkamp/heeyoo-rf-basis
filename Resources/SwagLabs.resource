*** Settings ***
Library     Browser  enable_presenter_mode={"duration": "1 seconds", "width": "2px", "style": "dotted", "color": "blue"}

# Complicated Xpath locator: //div[@class="inventory_item_description" and contains(.,"${item_name}")]//button


*** Keywords ***
Open SwagLabs
    [Arguments]  ${url}
    New Browser  chromium  headless=false  args=["--start-maximized"]
    New Context  viewport=${None}
    New Page     ${url}

Log in
    [Arguments]  ${user}  ${pass}
    Fill Text    id=user-name  ${user}
    Fill Text    id=password  ${pass}
    Click        id=login-button

Add to cart
    [Arguments]  ${item_name}  ${expected_count}
    Click        css=div.inventory_item_description >> text="${item_name}"
    Get Url     contains   https://www.saucedemo.com/inventory-item.html
    Click        id=add-to-cart
    Get Text     span.shopping_cart_badge  ==  ${expected_count}

Open cart
    Click    id=shopping_cart_container
    Get Url  ==  https://www.saucedemo.com/cart.html

Close cart
    Click  id=continue-shopping
    Get Url     ==  https://www.saucedemo.com/inventory.html

Validate orders in cart
    [Arguments]  @{item_names}
    Open cart
    ${elements}  Get Elements   div.inventory_item_name
    Log  ${elements}  console=true
    ${count}  Get Length    ${elements}
    Log  ${count}  console=true
    FOR  ${i}  IN RANGE  0  ${count}-1
        Get Text  ${elements}[${i}]  contains  ${item_names}[${i}]
    END

Validate logged in
    Get Url     ==  https://www.saucedemo.com/inventory.html

Validate login error
    Get Text    h3[data-test="error"]  ==  Epic sadface: Username and password do not match any user in this service