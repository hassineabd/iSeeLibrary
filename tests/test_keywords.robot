*** Settings ***
Library    AppiumImagePlugin
Library    AppiumLibrary

Documentation    This file is for testing python functions on top of the RobotFramework
...              pip install -r testenvrequirements.txt
...              use the following command to run test
...              cd tests/ (mandatory to be in this folder before running the next command)
...              browserstack-sdk robot -d results/ test_keywords.robot 
*** Variables ***
${REMOTE_URL}     http://0.0.0.0:4723    #    https://hub-cloud.browserstack.com/wd/hub

${appPackage}               com.applidium.vianavigo
${appActivity}              com.applidium.vianavigo.views.MainVianavigo
${AllowPopupCap_iOS}        autoAcceptAlerts
${AllowPopupCap_Android}    autoGrantPermissions
&{DESIRED_CAPABILITIES_Android}
...                         appium:deviceName=192.168.106.139:5555    # emulator-5554  R58NA4JWSVN
...                         platformName=Android
...                         appium:appPackage=${appPackage}
...                         appium:appActivity=${appActivity}
...                         appium:automationName=Uiautomator2
...                         appium:noReset=true
...                         appium:imageMatchThreshold= 0.2,  # Lower this value if needing more leniency
...                         appium:fixImageTemplateSize= false,  # Adjust according to your needs
...                         appium:checkForImageElementStaleness= true
#...                         appium:imageElementTapStrategy': 'w3cActions'
#...                         appium:chromedriverExecutable=${EXECDIR}/Resources/chromedriver/chromedriver
#...                         appium:language=${language}
#...                         appium:locale=${language}
#...                         ${AllowPopupCap_${platformName}}=true

&{DESIRED_CAPABILITIES_iOS}
...                         appium:deviceName=iphone rouge    # emulator-5554  R58NA4JWSVN
...                         platformName=iOS
#...                         appium:app=/Users/abdelkaderhassine/Downloads/app.ipa
...                         appium:automationName=XCUITest
...                         bundleId=com.vianavigo.iphone    
...                         udid=00008030-001869083A13402E    # 
...                         appium:automationName=XCUITest
...                         xcodeOrgId=KQZ7KNLUG5
...                         xcodeSigningId=iPhone Developer    
...                         appium:noReset=true
#...                         appium:language=${language}
#...                         appium:locale=${language}
#...                         ${AllowPopupCap_${platformName}}=true

${locator}    //*[&text="Rechercher un itinéraire"]
*** Test Cases ***
Test Click Image
    [Documentation]
    Open Application    ${REMOTE_URL}    &{DESIRED_CAPABILITIES_Android}
    click on image    bus.png
    #ElementScreenshot.Take Element Screenshot    //android.widget.Button[@resource-id="com.applidium.vianavigo:id/large_button"]    aaaaaa.png
    #Capture Page Screenshot    testtttt.png
    #Capture Element Screenshot    /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.widget.ScrollView/android.view.View[2]/android.view.View/android.view.View
    #Count Displayed Images    ${EXECDIR}/tests/toggleActivated.png
    #Click Image Aligned With Text    ${EXECDIR}/tests/toggleActivated.png    Activer l\'option
    # Sleep    2
    #Pinch Open Gesture
    #Click By Image    ${EXECDIR}/tests/bus.png
    #Is Image Displayed Using Screenshot    ${EXECDIR}/tests/toggleActivated.png     ${EXECDIR}/full_screenshot.png    
    #Capture Element Screenshot     #//*[@text="Rechercher un itinéraire"]/parent::*
    #Capture Page Screenshot
    #Appium Element Screenshot    //XCUIElementTypeStaticText[@name="IGNORER"]