# RAD WOMEN PART I

## About

Welcome! This Repo is the code base for RAD Women Part I, a ten-week course that introduces the basics of coding on the Salesforce Platform.  It contains class files with demonstration code, class exercises and homework that complements the other curriculum materials. If you have any questions, you can reach us at apexradwomen@gmail.com

We welcome contributions from anyone familiar with the course and proficient in Apex who would like to contribute.  We ask that you have experience with the curriculum, as it is important to understand which concepts have been introduced week-by-week, so that we have samples and examples that are accesssible to learners.  If that sounds like you, please feel free to fork and make a pull request!

## Resources

You can reach us at apexradwomen@gmail.com and on our website <http://radwomen.org/>

## Description of Files and Directories

Please note that this code base is in SFDX Format.  You can submit pull requests with updates to existing files, where appropriate, or new files.  If you're not sure, we recommend creating new files for your sample code, and we may choose to pull from those files and integrate with existing files and exercises.  

## Environment Setup

### Using SFDX

If you don't already have it, install the [Salesforce CLI](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_install_cli.htm).

1. Create a scratch org and provide it with an alias (**radorg** in the command below). NOTE: You will need to add a -d parameter if you want this org to last for more than 7 days (i.e. -d 30):

    ```bash
    sfdx force:org:create -s -f config/project-scratch-def.json -a radorg
    ```

1. Push source to your scratch org:

    ```bash
    sfdx force:source:push
    ```

1. Assign the PantryApp permission set to the default user:

    ```bash
    sfdx force:user:permset:assign -n PantryApp
    ```

1. Open the scratch org:

    ```bash
    sfdx force:org:open
    ```

### Using CumulusCI

[Laura's stuff here]

## Top Needs

While we welcome bug reports and refinements in all areas, we are particularly interested in:

1. Sample Trigger/Trigger Handler patterns (Beginner Friendly!)
2. Practice exercises for challenging concepts (Maps, Loops, Bulk Patterns, Object-Oriented Code)
3. Improvements to sample code and exercises to make them more realistic for a typical Salesforce implementation and/or to update older patterns into currently accepted best practices.

## Rights
All Content is the property of RAD Women and is provided for the express purpose of curriculum improvement submissions.  Please contact us at apexradwomen@gmail.com before using or distributing any portion of this or other RAD materials.
=======
## Setting up an org with CumulusCI
This project includes CumulusCI configuration files as a convenience for anyone who is already using CumulusCI (typically coaches). If you are not already a cci user, skip this section and use the installation instructions that were emailed to you.

[CumulusCI](https://cumulusci.readthedocs.io/) is an automation framework that helps quickly configure Salesforce orgs. If you are already a cci user, you can create an org from the repository with picklists and page layouts updated by doing the following:

1. Create an org.
    - Option A: Create a new scratch org (`cci org scratch dev radscratchorg`). This is a temporary org so use this option for office hours or other short use cases. (It lasts for 7 days by default.)
    - Option B: Sign up for a developer org at developer.salesforce and [connect it to cci](https://cumulusci.readthedocs.io/en/stable/connected_orgs.html) (`cci org connect raddevorg`).
2. Make sure the install password is saved as an environment variable. You can do this temporarily by running `export RAD_PACKAGE_KEY=replacethiswithpassword` from the command line.
3. Run dev org flow to complete configuration (`cci flow run dev_org --org raddevorg`).