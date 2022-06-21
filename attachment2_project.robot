*** Test Cases ***
Test CXTM
    [tags]   TDD
    embed screenshots
    set browser timeout to "60" seconds
    Login to CXTM
    Go to project view
    Go to sandbox projects
    ${name}=  Generate Random String
    Create new sandbox project with name "Test Project ${name}"
    Go to test cases overview for project "Test Project ${name}"
    Go to project secrets
    Add new secret environment variable with name "SECRET1" and value "one"
    Go to project view
    Go to sandbox projects
    Go to test cases overview for project "Test Project ${name}"
    ${tc_name}=  Add new testcase with automation using a random name and secret
    Run testcase and skip topology
    Wait until job file is queued
    Wait for job status to show on the page
    Wait for job to finish
    save screenshot
    ${b}=   Get contents of artifact "output.xml"
    should contain   ${b}     SECRET1=one
    click on link with text "${tc_name}"
    Click on testcase url with title "${tc_name}"
    Open delete testcase
    Delete testcase
