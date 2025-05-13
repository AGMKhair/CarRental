# Car Rental

Car Services

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Release Note : 
keytool -genkeypair -alias key -keyalg RSA -keysize 2050 -validity 20000 -keystore key.jks

- Need to update key.properties file 

      storePassword=
      keyPassword=
      keyAlias=key
      storeFile=release_key/key.jks

- Need to update build.gradle


    def keystoreProperties = new Properties()
    def keystorePropertiesFile = rootProject.file('key.properties')
    if (keystorePropertiesFile.exists()) {
    keystorePropertiesFile.withReader('UTF-8') { reader ->
    keystoreProperties.load(reader)
    }
    }

    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }


- flutter Clean
- flutter  pub get
- flutter build appbundle