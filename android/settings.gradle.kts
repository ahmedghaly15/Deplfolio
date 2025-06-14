pluginManagement {
    val flutterSdkPath = run {
        val properties = java.util.Properties()
        file("local.properties").inputStream().use { properties.load(it) }
        val flutterSdkPath = properties.getProperty("flutter.sdk")
        require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
        flutterSdkPath
    }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }

plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android") // ✅ Use the correct plugin ID
    id("com.google.gms.google-services")
    id("dev.flutter.flutter-gradle-plugin")
}

include(":app")