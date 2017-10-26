# gr8di

#### Build Status
- [![Build Status](https://travis-ci.org/aanorbel/gr8di.svg?branch=master)](https://travis-ci.org/aanorbel/gr8di)

Getting Started
---

You need a Java Development Kit (JDK) installed, but it is not necessary to install Groovy because it's bundled with the Grails distribution.

To install Grails, visit http://grails.org/Download and download the version you would like to use. Set a `GRAILS_HOME` environment variable to point to the root of the extracted download and add `GRAILS_HOME/bin` to your executable `PATH`. Then in a shell, type the following:

	grails create-app sampleapp
	cd sampleapp
	grails run-app

To build Grails, clone this GitHub repository and execute the install Gradle target:

    git clone https://github.com/aanorbel/gr8di.git
    cd grails-core
    
    npm install
    gulp 
    
    ./gradlew install

    
If you encounter out of memory errors when trying to run the install target, try adjusting Gradle build settings. For example:

    export GRADLE_OPTS="-Xmx2G -Xms2G -XX:NewSize=512m -XX:MaxNewSize=512m -XX:MaxPermSize=1G"

